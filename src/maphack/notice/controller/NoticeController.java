package maphack.notice.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NoticeController {
	
	//메인 시작
	@RequestMapping(value = "notice.mh")
	public String home(Locale locale, Model model) {
		return "notice/notice";
	}
	
}