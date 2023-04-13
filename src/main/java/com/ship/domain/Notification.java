package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notification {
	private int notiNum; 		// �˸� ��ȣ
	private String notiSubject;	// �˸� ����
	private String notiContent;	// �˸� ����
	private int notiStatus; 	// �˸� Ȯ�� ����
		
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date notiWdate;		// �˸���ϳ�¥
		
	private int usrNum; 		// �˸����� ȸ����ȣ foreign 
	private int shipNum;		// �˸����� ���ӹ�ȣ foreign
	
}
