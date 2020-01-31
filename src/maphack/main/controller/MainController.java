package maphack.main.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	//메인 시작
	@RequestMapping(value = "main.mh")
	public String home(Locale locale, Model model) {
		return "main/mapHackMain";
	}
	
}
