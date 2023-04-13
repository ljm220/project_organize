package com.ship.util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.google.gson.JsonElement;

import com.google.gson.JsonParser;
import com.ship.domain.Usr;
import com.ship.service.UsrService;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class NaverManager {				// ���� code >> *url* >> access_token ..
	@Autowired
	private UsrService usrService;
	
	public Usr insertNaverUsr(String code) throws Exception {
		String accessToken = getAccessToken(code);
		
		
		Usr naverUsr = getNaverUserInfo(accessToken);
		log.info(" # naverUsr : "+naverUsr);
				
		
		boolean flag =  usrService.checkExistSocialUsrS(naverUsr);
		Usr loginUsr = new Usr();
		if(flag) {
			//üũ�� ���̵� ������
			loginUsr = usrService.loginS(naverUsr);
			
		}else {
			//üũ�� ���̵� ������
			usrService.insertNewSNSUsrS(naverUsr);
			loginUsr = usrService.loginS(naverUsr);
		}
		return loginUsr;
	}
	public String getAccessToken(String code) {
		System.out.println("# ����");
		
		String myKey = "PmDK4uSWc9qq8rZ1axUY"; // # ������ �߱޹��� REST API KEY
		String mySecretKey = "xLbutJqtbl";		
		String access_token = "";
		String refresh_token = "";
		
		String reqURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"; 		//GET ������� ����
		reqURL += "&client_id="+myKey;
		reqURL += "&client_secret="+mySecretKey; 
		reqURL += "&code="+code;		//�߱޹��� �ڵ� 
		reqURL += "&state=oauth_state"; //������ 
		try {
			System.out.println("# reqURL : " + reqURL );
		      URL url = new URL(reqURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      System.out.println(" # responseCode="+responseCode);			//200 ������ ���
		      if(responseCode==200) { // ���� ȣ��
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // ���� �߻�
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer stb = new StringBuffer();	//���ڿ� �߰�
		      
		      while ((inputLine = br.readLine()) != null) {
		    	  stb.append(inputLine);
		      }
		      br.close();
		      String result = stb.toString();
		      if(responseCode==200) {
		    	  System.out.println(" # result : "+result);
		      }  
		      JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			System.out.println(" # access_token-element : "+element);
			System.out.println(" # access_token.()  type_element : " + element.getClass().getName());
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println(" # access_token : "+access_token);
		      return access_token;
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		return "";
	}
	public Usr getNaverUserInfo(String accessToken) throws Exception {
		System.out.println("# ����22222222 : " );
		System.out.println("# accessToken : "+ accessToken );
        String apiURL = "https://openapi.naver.com/v1/nid/me";        
        
        try {
		      URL url = new URL(apiURL);
		      System.out.println("# naverserviceimpl url : " + url );
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      con.setRequestProperty("Authorization", "Bearer " + accessToken);
		      int responseCode = con.getResponseCode();
		      BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		      System.out.println(" # naverserviceimpl responseCode="+responseCode);			//200 ������ ���
		      String line = "";
		      String result = "";
		      
		      while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println(" # naverServiceImpl.() result : " + result );

				
				// Gson ���̺귯���� JSON�Ľ�
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
				
				System.out.println(" # naverServiceImpl.() element : " + element );
								
//				JsonElement responseJsonObject = element.getAsJsonObject().get("response"); //element �ӿ� �ִ� val �Ľ�
						
				
				

				String naverUsrId = element.getAsJsonObject().get("response").getAsJsonObject().get("id").getAsString(); // id ���� ������ true
				System.out.println(" # naverServiceImpl.() naverUsrId : " + naverUsrId );

				
				Usr naverUsr = new Usr();	
				
				if (naverUsrId != null) {
					String NaverUsrId = element.getAsJsonObject().get("response").getAsJsonObject().get("id").getAsString();
					String NaverUsrEmail = element.getAsJsonObject().get("response").getAsJsonObject().get("email").getAsString();
					String NaverUsrNickname = element.getAsJsonObject().get("response").getAsJsonObject().get("name").getAsString();
					String NaverUsrGender = element.getAsJsonObject().get("response").getAsJsonObject().get("gender").getAsString();
					String NaverUsrPhotoPath = element.getAsJsonObject().get("response").getAsJsonObject().get("profile_image").getAsString();
					
					
					
					String NaverUsrBirthday = element.getAsJsonObject().get("response").getAsJsonObject().get("birthday").getAsString();
					String NaverUsrBirthyear = element.getAsJsonObject().get("response").getAsJsonObject().get("birthyear").getAsString();
					
					naverUsr = new Usr(NaverUsrId,NaverUsrEmail,NaverUsrNickname,NaverUsrGender,NaverUsrPhotoPath,"NAVER");
					
					
					System.out.println(" # naverUsr : "+naverUsr);					
					System.out.println(" # usrId : "+NaverUsrId);
					System.out.println(" # usrEmail : "+NaverUsrEmail);
					System.out.println(" # usrNickname : "+NaverUsrNickname);
					System.out.println(" # usrGender : "+NaverUsrGender);
					System.out.println(" # usrPhotoPath : "+NaverUsrPhotoPath);
					System.out.println(" # birthday : "+NaverUsrBirthday);
					System.out.println(" # birthyear : "+NaverUsrBirthyear);
					System.out.println(" # naverServiceImpl.getnaverUserInfo() NaverUsrEmail : " + NaverUsrEmail + "\n");
				}				

				br.close();
				log.info(" # naverUsr : "+naverUsr);
				return naverUsr;

			} catch (IOException e) {
				log.info("# naverServiceImpl.getnaverUserInfo() Exception e : "+ e + "\n");			
				return null;
			}
		}
	}
