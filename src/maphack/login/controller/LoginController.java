package maphack.login.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.login.dto.Member;
import maphack.login.service.LoginService;


@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	//메인 시작
	@RequestMapping(value = "login.mh")
	public String login(Locale locale, Model model) {

		return "login/login";
	}
	@RequestMapping(value = "logout.mh")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "main/mapHackMain";
	}
	@ResponseBody
	@RequestMapping(value = "sessionConfirm.mh")
	public void sessionConfirm(HttpSession session,HttpServletResponse response) {
		String loginconfirm = "1";
		if(session.getAttribute("id")==null) {
			loginconfirm = "0";
		}
		String nextconfirm = "1";
		if(session.getAttribute("next")==null) {
			nextconfirm = "0";
		}
		
		
		JSONObject obj = new JSONObject();
		obj.put("loginconfirm", loginconfirm);
		obj.put("nextconfirm", nextconfirm);
		
		try {
			response.getWriter().print(obj.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "loginconfirm.mh")
	public void loginConfirm(Model model, Member member, HttpServletResponse response, HttpSession session) {

		int loginconfirm = service.loginConfirm(member);

		String confirm = Integer.toString(loginconfirm);

		if(loginconfirm > 0) {
			System.out.println("로그인 아이디 : "+member.getmId());
			session.setAttribute("id", member.getmId());
		}
		
		try {
			response.getWriter().print(confirm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
