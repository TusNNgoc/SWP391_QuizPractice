/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;

/** 
 * @author ASUS
 * TLS n SSL
 */
public class SendEmailReset {
        static final String from = "goquiz99@gmail.com";
        static final String password = "xsfkcbubygvrtrsv";
    public static boolean sendmail(String to, String NoiDung, String Subject){
        
        //Properties : Khai bao cac thuoc tinh
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
        props.put("mail.smtp.port", "587"); //TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        //Create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from,password);
            }           
        };
        
        //Phien lam viec
        Session session = Session.getInstance(props,auth);
        
        //Gui email
        MimeMessage msg = new MimeMessage(session);
        try{
            //Kieu nd
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            //Send
            msg.setFrom(from);
            //To
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //Tieu de
            msg.setSubject(Subject);
            // Quy dinh ngay gui
            msg.setSentDate(new Date());
            //Quy dinh email tra loi
            //msg.setReplyTo(InternetAddress.parse(from, false));
            //Noi dung
            msg.setText(NoiDung,"UTF-8");
            //Gui email
            Transport.send(msg);
            System.out.println("Gui mail thanh cong");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public static void main(String[] args) {
        SendEmailReset.sendmail("rerollchotrung@gmail.com","Day la noi dung","Tieu de");
    }   
}
