package maphack.travelmap.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import maphack.infodetail.common.InfoDetail;
import maphack.infodetail.common.InfoVO;

@Controller
public class TravelMapController {

	@Autowired
	private InfoDetail infoDetail;
   //지도만들기 시작
   @RequestMapping(value = "makeMap.mh")
   public String test2(Model model,Model model2,Model model3,Model model4, InfoVO infoVO, Model step2list, HttpSession session) {
	 	
	      
	      return "makemap/mapSearch";
}
}
