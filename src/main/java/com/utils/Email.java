package com.utils;
import java.util.Random;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class Email {
	/**
	 * 
	 * @param email_to gửi đến email
	 * @param option true = mã xác nhận, false = reset password
	 * @param length độ dài password
	 * @return
	 */
	public static String sendMail(String email_to, boolean option, int length) {
		 // Thông tin tài khoản email
	
		String maxn = "";
        String username = "anhbao5cm@gmail.com";
        String password = "mcvs bzys kboj abcp";
        System.out.println("Running");
        // Tạo đối tượng HtmlEmail
        HtmlEmail email = new HtmlEmail();
        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator(username, password));
        email.setStartTLSRequired(true);
     // Cấu hình máy chủ SMTP
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
     // Tạo Authenticator để xác thực tài khoản email
//        Authenticator auth = new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(username, password);
//            }
//        };
//
//        // Tạo phiên gửi email
//        Session session = Session.getInstance(props, auth);
//
//        try {
//            // Tạo một đối tượng MimeMessage
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(username));
//            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("recipient_email@example.com"));
//            message.setSubject("Email with Attachment");
//
//            // Tạo một đối tượng Multipart
//            MimeMultipart multipart = new MimeMultipart();
//
//            // Thêm nội dung email
//            MimeBodyPart messageBodyPart = new MimeBodyPart();
//            messageBodyPart.setText("This is the message body");
//            multipart.addBodyPart(messageBodyPart);
//
//            // Thêm file đính kèm
//            MimeBodyPart attachPart = new MimeBodyPart();
//            String attachFile = "path/to/your/file.txt"; // Đường dẫn của file đính kèm
//            DataSource source = new FileDataSource(attachFile);
//            attachPart.setDataHandler(new javax.activation.DataHandler(source));
//            attachPart.setFileName("file.txt"); // Tên của file đính kèm
//            multipart.addBodyPart(attachPart);
//
//            // Đặt nội dung Multipart vào Message
//            message.setContent(multipart);
//
//            // Gửi email
//            Transport.send(message);
//
//            System.out.println("Email sent successfully!");
//
//        } catch (MessagingException e) {
//            e.printStackTrace();
//        }
        try {
        	
            // Thiết lập người gửi
        	email.setCharset("utf-8"); // tv
            email.setFrom(username);

            // Thiết lập người nhận
            email.addTo(email_to);

            
            
            // Thiết lập nội dung email
            if(option) {
            	maxn = String.valueOf(generateRandomNumber());
            	// Thiết lập tiêu đề
                email.setSubject("Xác nhận mã OTP");
            	email.setMsg("Mã xác nhận: "+maxn);
            }else {
            	// Thiết lập tiêu đề
                email.setSubject("Quên mật khẩu");
                maxn = generateRandomString(length);
            	email.setMsg("Mật khẩu mới: "+maxn);
            }
            
            

            // Gửi email
            email.send();

            System.out.println("Email sent successfully!");
        
        } catch (EmailException e) {
            e.printStackTrace();
        }
		return maxn;
        
       // System.out.println("Done send");
    }
	
	public static int generateRandomNumber() {
        Random random = new Random();
        return 1000 + random.nextInt(9000); // Tạo số ngẫu nhiên từ 1000 đến 9999 (bao gồm cả 1000 và 9999)
    }
	
	public static int generateRandomNumber2(int length) {
        // Tính toán giới hạn dưới và giới hạn trên dựa trên length
        int min = (int) Math.pow(10, length - 1); // Ví dụ: length = 3 -> min = 100
        int max = (int) Math.pow(10, length) - 1; // Ví dụ: length = 3 -> max = 999

        Random random = new Random();
        return random.nextInt(max - min + 1) + min; // Sinh số ngẫu nhiên trong khoảng [min, max]
    }
	
	
    public static String generateRandomString(int length) {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(characters.length());
            char randomChar = characters.charAt(randomIndex);
            sb.append(randomChar);
        }

        return sb.toString();
    }

    }
