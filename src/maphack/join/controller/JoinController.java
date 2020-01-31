package maphack.join.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.join.common.Email;
import maphack.join.common.EmailSender;
import maphack.join.dto.Member;
import maphack.join.service.JoinService;


@Controller
public class JoinController {
	@Autowired
    private EmailSender emailSender;
 
    @Autowired
    private Email email;
    
    @Autowired
    private JavaMailSender mailSender;
    
	@Autowired
	private JoinService service;
	//메인 시작
	@RequestMapping(value = "join.mh")
	public String login(Locale locale, Model model) {

		return "join/join";
	}
	
	@ResponseBody
	@RequestMapping(value = "makeMember.mh")
	public void makeMember(Model model, Member member, HttpServletResponse response, HttpSession session) {
		String confirm = "";
		if(String.valueOf(session.getAttribute("emailresult")).equals("0")) {
			confirm = "2";
		}else {
			int loginconfirm = service.makeMember(member);
			confirm = Integer.toString(loginconfirm);
			

			if(loginconfirm > 0) {
				session.setAttribute("id", member.getmId());
			}
		}
		
		
		try {
			response.getWriter().print(confirm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@ResponseBody
	@RequestMapping(value = "sendEmail.mh")
	public void sendEmail(HttpServletRequest request,@RequestParam("email") String sendemail,HttpSession session) {
	Random rnd =new Random();

	StringBuffer emailpass =new StringBuffer();

		for(int i=0;i<20;i++){

		    // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append 한다.

		    if(rnd.nextBoolean()){

		    	emailpass.append((char)((int)(rnd.nextInt(26))+97));

		    }else{

		    	emailpass.append((rnd.nextInt(10)));

		    }

		}
	session.setAttribute("emailpass", emailpass);
	email.setContent("비밀번호는 "+emailpass+" 입니다."); // 이메일로 보낼 메시지
    email.setReceiver(sendemail); // 받는이의 이메일 주소
    email.setSubject("MapHack 인증 메일입니다."); // 이메일로 보낼 제목
     
 
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper;
		try {
			messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
			messageHelper.setSubject(email.getSubject());
	        messageHelper.setText(email.getContent());
	        messageHelper.setTo(email.getReceiver());
	        messageHelper.setFrom("lhbdong@gmail.com"); // 보내는 이의 주소(root-context.xml 에서 선언했지만 적어줬음)
	        msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
	        mailSender.send(msg);
	        
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
        
	}
	@ResponseBody
	@RequestMapping(value = "emailPass.mh")
	public void emailPass(HttpServletRequest request,@RequestParam("emailpass") String emailpass,HttpSession session,HttpServletResponse response) {
	
		int result = 0;
     
	
        if(emailpass.equals(String.valueOf(session.getAttribute("emailpass")))){
        	result = 1;
        }
        
        session.setAttribute("emailresult",result);
        
        try {
			response.getWriter().print(String.valueOf(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        
	}
	
	
}
