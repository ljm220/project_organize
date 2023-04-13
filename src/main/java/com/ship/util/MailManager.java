package com.ship.util;

import javax.mail.internet.MimeMessage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.ship.util.RandomCode;

@Component
public class MailManager {
	@Autowired
	private JavaMailSender mailSender;
		
	public String sendUsrEmailCode(String usrEmail , String usrName) {
		
		String code = new RandomCode().makeEmailCode(4);
		String mailContent = new MailContent().makeSignUpContent(usrName, code);
		
		String subject = "���������� ���� ���������Դϴ�";		
		String from = "ship-geather@naver.com";
		String to = usrEmail;
		try {
			MimeMessage mail = mailSender.createMimeMessage();			
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			// true�� ��Ƽ��Ʈ �޼����� ����ϰڴٴ� �ǹ�
			// �ܼ��� �ؽ�Ʈ�϶�  
			// MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");

			mailHelper.setFrom(from);
			// �� ���̵� ������ ���� �ܼ��� smtp ������ �ޱ� ���� ��� ���� ��������(setFrom())�ݵ�� �ʿ�
			// �������̿� �����ּҸ� �����ϴ��̰� ���� ��� ǥ�� �Ϸ���
			// mailHelper.setFrom("���Դ� <ship-gaether@naver.com>");
			mailHelper.setTo(to);
			mailHelper.setSubject(subject);
			mailHelper.setText(mailContent, true);
			// true�� html�� ����ϰڴ�.
			// �ܼ� �ؽ�Ʈ �϶�
			// mailHelper.setText(content);
			mailSender.send(mail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return code;
	}
	
	public String sendUsrFindPwd() {
		
		return "";
	}
}
