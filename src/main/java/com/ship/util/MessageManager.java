package com.ship.util;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.ship.util.RandomCode;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Component
public class MessageManager {
	
	public String sendUsrPhoneCode(String to) throws CoolsmsException{
		
		String apiKey = "NCSTENSYCZ2P2WZK"; // 문자 서비스회사 : COOLSMS  / 에 가입하고 받은 apiKey임
		String apiSecret = "U5ALK5TXDRVGVJYKLURLPWISZ8NYXYGQ";
		
		Message coolsms = new Message(apiKey, apiSecret);
		
		String phoneCode = new RandomCode().makePhoneCode(4);		  
		
		HashMap<String, String> message = new HashMap<String, String>();
		message.put("to", to);    // 수신전화번호 (ajax로 view 화면에서 받아온 값으로 넘김)
		message.put("from", "01087648381");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		message.put("type", "sms");
		message.put("text", "안녕하세요. \nShip-Gaether 입니다 \n인증번호는 [" + phoneCode + "] 입니다.");
		
	    coolsms.send(message); // 메시지 전송
		return phoneCode;
	}
}
