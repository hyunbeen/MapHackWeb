package maphack.mypage.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import maphack.mypage.dto.Favorite;
import maphack.mypage.dto.TravelMap;
import maphack.mypage.service.MyPageService;


@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;
	//마이페이지_메인
	@RequestMapping(value = "myPageMain.mh")
	public String home(String tab, Model model, HttpSession session) {
	

			System.out.println("첫페이지 컨트롤러타기");
			JSONObject objresult = new JSONObject();
	          String bmMid = String.valueOf(session.getAttribute("id"));
	          
	          String[] arr;
	   try {
	          List<Favorite> favoritelist = service.favoriteList(bmMid);
	          List detaillist = new ArrayList();
	          for(int i=0; i< favoritelist.size(); i++) {
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//                "&contentTypeId=12&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
         String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
                 "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
                 "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//         String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                 "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//                 "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//         String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                 "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//                 "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
         StringBuffer detailjsonSb = new StringBuffer();
         
         URL detailu = new URL(detailurl);
         InputStream detailis = detailu.openStream();
         
         BufferedReader detailbr = new BufferedReader(new InputStreamReader(detailis, "UTF-8"));
         String detailline = "";
         while((detailline = detailbr.readLine())!=null) {
            detailjsonSb.append(detailline);
         }
         detailbr.close();
         detailis.close();

         JSONParser detailjp = new JSONParser();
         JSONObject detailjo1 = (JSONObject) detailjp.parse(detailjsonSb.toString());
         JSONObject detailjo2 = (JSONObject) detailjo1.get("response");
         JSONObject detailjo3 = (JSONObject) detailjo2.get("body");
         JSONObject detailjo4 = (JSONObject) detailjo3.get("items");
         JSONObject detailja1 = (JSONObject) detailjo4.get("item");

         detaillist.add(detailja1);
         }
	          model.addAttribute("list", detaillist);
	          model.addAttribute("count", favoritelist.size());
	          System.out.println(detaillist);
	          
         }catch(Exception e) {
        	 System.out.println(e);
         }
         
			//model.addAttribute("list", infoDetail.areaBasedList(infoVO)) ;
			
			
 			String m_id = String.valueOf(session.getAttribute("id"));
 			List<TravelMap> travelList = service.travelList(m_id);
			model.addAttribute("travelList", travelList);
			
				


		
		
		return "mypage/myPageMain";
	}
	
	
	//1. 마이페이지_즐겨찾기 목록 페이지
	@RequestMapping(value = "myBookMarkList.mh")
	public void myBookMarkList(Model model, HttpServletResponse response) {
		System.out.println("북마크 컨트롤러타기");
		JSONObject objresult = new JSONObject();
        String bmMid = "omy";

        String[] arr;
 try {
        List<Favorite> favoritelist = service.favoriteList(bmMid);

        List detaillist = new ArrayList();
        for(int i=0; i< favoritelist.size(); i++) {
//          String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//          "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//          "&contentTypeId=12&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
           "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
           "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//           "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//           "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//           "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//           "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
   StringBuffer detailjsonSb = new StringBuffer();
   
   URL detailu = new URL(detailurl);
   InputStream detailis = detailu.openStream();
   BufferedReader detailbr = new BufferedReader(new InputStreamReader(detailis, "UTF-8"));

   String detailline = "";
   while((detailline = detailbr.readLine())!=null) {
      detailjsonSb.append(detailline);
   }
   detailbr.close();
   detailis.close();
   

   JSONParser detailjp = new JSONParser();
   JSONObject detailjo1 = (JSONObject) detailjp.parse(detailjsonSb.toString());
   JSONObject detailjo2 = (JSONObject) detailjo1.get("response");
   JSONObject detailjo3 = (JSONObject) detailjo2.get("body");
   JSONObject detailjo4 = (JSONObject) detailjo3.get("items");

   JSONObject detailja1 = (JSONObject) detailjo4.get("item");

   detaillist.add(detailja1);
   }
 
        model.addAttribute("list", detaillist);
        objresult.put("detaillist", detaillist);
        System.out.println("favorite 리스트"+detaillist);
        
        response.getWriter().print(objresult.toJSONString());
        
   }catch(Exception e) {
  	 System.out.println(e);
   }
		
//		return "mypage/myBookMarkList";
	}
	
	//1. 마이페이지_즐겨찾기 목록 pagination
	@RequestMapping(value= "myListPagination")
	public String pagination(Model model) {
		
		
		
		
		
		return "mypage/myBookMarkList";
	}
	
	
	//2. 마이페이지_여행짜기 목록 페이지
	@RequestMapping(value = "myMakeMapList.mh")
	public String myMakeMapList(Locale locale, Model model) {
		System.out.println("마이페이지 컨트롤러");
		return "mypage/myMakeMapList";
	}
	
	//3. 마이페이지_여행후기 목록 페이지
	@RequestMapping(value = "myAfterList.mh")
	public String myAfterList(Locale locale, Model model) {
		System.out.println("마이페이지 컨트롤러");
		return "mypage/myAfterList";
	}
	
	//4. 마이페이지_친구관리 목록 페이지
	@RequestMapping(value = "myFrinedList.mh")
	public String myFrineList(Locale locale, Model model) {
		System.out.println("마이페이지 컨트롤러");
		return "mypage/myFrinedList";
	}
	
	//5. 마이페이지_회원정보 수정 페이지
	@RequestMapping(value = "myModify.mh")
	public String myModify(Locale locale, Model model) {
		System.out.println("마이페이지 컨트롤러");
		return "mypage/myModify";
	}
	
	
	
	
	
}
