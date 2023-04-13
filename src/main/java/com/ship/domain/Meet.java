package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Meet {
	private int meetNum; 		// ���� ��ȣ
	private int shipNum; 		// ������ ���� ���� ��ȣ foreign
	private String meetLoc;		// ���� ���
	private String meetContent;	// ���� ����
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date meetMdate;		// ���� ��¥
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date meetWdate;		// ���� �ۼ���¥
	
	private int meetStatus; 	// ���� ���� 0��û�ް��ִ��� 1����ȸ������� 
	private int limitStatus;	// ���� �ο����� ���� 0,1
	private int limitEnd; 		// ���� �ο����� ��� ����
	
}
