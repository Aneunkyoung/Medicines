package com.medicines.util;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;

public class EmailSend {
	private JavaMailSender mailSender;

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public String sendEmail(String email, String subject, String content) {
		MimeMessage message=mailSender.createMimeMessage();
		
		try {
			message.setSubject(subject);
			message.setContent(content,"text/html; charset=utf-8"); 
			message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return email;
	}
}