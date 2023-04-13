package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Report {
	private int reportNum; 			// �Ű��ȣ
	private int usrNum; 			// �Ű��� ȸ����ȣ foreign
	private int shipNum; 			// �Ű���� ���ӹ�ȣ foreign	
	private String reportContent;	// �Ű���
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date reportRdate;		// �Ű�¥		
	private int reportStatus;		// �Ű�  ó�� ���� 0,1
}
