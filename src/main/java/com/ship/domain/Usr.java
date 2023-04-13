package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Usr {
	private int usrNum; // 회원번호
	private String usrId; // 회원아이디
	private String usrEmail; // 이메일
	private String usrPhone; // 회원휴대폰번호
	private String usrPwd; // 비밀번호
	private String usrName; // 회원이름
	private String usrNickname; // 닉네임
	private Date usrBirth; // 생년월일
	private String usrGender; // 성별 카카오 구글 네이버 에서 male female 이렇게 보내줘서 String으로
	private int usrCity; // 회원도시
	private int usrTown; // 회원군구
	private int usrPhoto; // 프사 사용여부 0=기본사진 1= 자기사진
	private String usrPhotoPath;// 프사 src 주소(경로)

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone = "Asia/Seoul")
	private Date usrRdate; // 가입날짜
	
	private String updateThing;

	// 회원가입할때
	public Usr(String usrId, String usrEmail, String usrPhone, String usrPwd, String usrName, String usrNickname,
			Date usrBirth, String usrGender, int usrCity, int usrTown) {
		this.usrId = usrId;
		this.usrPhone = usrPhone;
		this.usrEmail = usrEmail;
		this.usrPwd = usrPwd;
		this.usrName = usrName;
		this.usrNickname = usrNickname;
		this.usrBirth = usrBirth;
		this.usrGender = usrGender;
		this.usrCity = usrCity;
		this.usrTown = usrTown;
	}

	// 아이디+핸드폰 으로 비밀번호찾을때
	public Usr(String usrId, String usrPwd) {
		this.usrId = usrId;
		this.usrPwd = usrPwd;
	}
	// 카카오 로그인
	public Usr(String usrId,String usrEmail,String usrNickname,String usrGender,String usrPhotoPath,String usrFrom) {
		this.usrId = usrId;
		this.usrEmail = usrEmail;
		this.usrPwd = usrFrom;		
		this.usrPhone = "77777777777";
		this.usrNickname = usrNickname;
		this.usrGender = usrGender;
		this.usrPhotoPath = usrPhotoPath;
	}
	
	public Usr(int usrNum , String updateThing){
		this.usrNum=usrNum;
		this.updateThing=updateThing;		
	}

}
