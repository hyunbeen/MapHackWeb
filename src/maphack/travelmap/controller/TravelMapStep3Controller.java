package maphack.travelmap.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import maphack.infodetail.common.InfoDetail;
import maphack.travelmap.dto.MapGroup;
import maphack.travelmap.dto.Member;
import maphack.travelmap.service.GroupMapService;



@Controller
public class TravelMapStep3Controller {
	@Autowired
	private InfoDetail infoDetail;
   @Autowired
   private GroupMapService service;
   //지도만들기 시작
  
      @RequestMapping(value = "step3.mh")
      public String test3(Model model) {
         List<Member> listMember = service.listMember();
         MapGroup[] groupMember = service.groupMember();
         model.addAttribute("listMember",listMember);
         model.addAttribute("groupMember",groupMember);
         return "makemap/step3";
      } 
   
}
    //주석