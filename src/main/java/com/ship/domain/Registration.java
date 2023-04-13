package com.ship.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Registration {
	private int regNum; 		// ������û�� ��ȣ
	private int crewNum;		// ���� ��û�� crew��ȣ foreign
	private int meetNum;		// ��û���� ���� meet��ȣ foreign
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss", timezone="Asia/Seoul")
	private Date regRdate;		// ������û�� �ۼ���¥	
}
