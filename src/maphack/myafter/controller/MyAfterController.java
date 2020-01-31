package maphack.myafter.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MyAfterController {
	
	//메인 시작
	@RequestMapping(value = "myAfter.mh")
	public String home(Locale locale, Model model) {
		
		System.out.println("12313213213controller2");
		return "myafter/myAfter";
	}
	
}
