package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Survey {
	private int surveyNum; 			// ����������ȣ
	private int shipNum; 			// ���������� ���ӹ�ȣ foreign
	private String surveyContent;	// ������������
}
