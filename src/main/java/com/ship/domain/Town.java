package com.ship.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Town {
	private int townNum; 		// ���� ��ȣ	
	private String townName;	// ���� ��
	private int cityNum; 		// ���� ��ȣ foreign
}
