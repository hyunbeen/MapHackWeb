package maphack.mytravel.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.mypage.dto.Favorite;
import maphack.mypage.service.MyPageService;
import maphack.travelmap.dto.Mark;
import maphack.travelmap.dto.TravelMap;
import maphack.mytravel.service.MyTravelService;




@Controller
public class MyTravelController {
	@Autowired
	private MyPageService bmservice;
	@Autowired
	private MyTravelService service;
	//메인 시작
	@RequestMapping(value = "myMakeMapDetail.mh")
	public String myMakeMapDetail(Locale locale, Model model,String id,HttpSession session) {
		System.out.println("~~~~~~~~~여행지도 상세");
		System.out.println(id);
		String travelday = "travelday";
		 TravelMap tm = new TravelMap();
		 tm = service.myMakeMapDetail(id);
		 for(int i=1;i<=tm.getMap_day_list().size();i++) {
			 List<Mark> listMark = tm.getMap_day_list().get(i-1).getMap_date();
			 session.setAttribute(travelday+String.valueOf(i), listMark);
		 }
		session.setAttribute("traveldaynum",tm.getMap_day_list().size());
		model.addAttribute("traveldaytitle",tm.getMap_title());
		session.setAttribute("traveldaytitle",tm.getMap_title());
		model.addAttribute("traveldayimg",tm.getMap_fname());
		session.setAttribute("traveldayimg",tm.getMap_fname());
	    
	    
	         
	       
		return "mytravel/myMakeMapDetail";
	}
	
	//메인 시작
		@RequestMapping(value = "myMakeMapModify.mh")
		public String myMakeMapModify(HttpSession session,Model model) {
			
				
	
		       int dayindex = 0;
		       if(session.getAttribute("traveldaynum")!=null) {
		    	   dayindex = (Integer)session.getAttribute("traveldaynum");
		       };
		       session.setAttribute("dayindex", dayindex);
		       int realindex = 0;
		       if(session.getAttribute("traveldaynum")!=null) {
		    	   realindex = (Integer)session.getAttribute("traveldaynum");
		       };
		       session.setAttribute("realday", realindex); //원래 날짜 인덱스
		       dayindex = dayindex+5; //예비일자 확보
		         List<Mark> dl  = (List<Mark>) session.getAttribute("dragList");
		         if(dl==null) {
		        	 dl = new ArrayList();
		         }
		       for(int i=1;i<=dayindex;i++) {
		  			String day = "list";
		  			day += String.valueOf(i);
		  			List<Mark> newdl = new ArrayList();
		  			for(int j=0;j<dl.size();j++) {
		  				Mark newMark = new Mark();
		  				newMark = dl.get(j);
		  				newdl.add(newMark);
		  			}
		    			session.setAttribute(day, newdl);
		  		}
		       
		       
		       model.addAttribute("lastday", dayindex);
		       
		    
		     //즐겨찾기 데이터
		       
			JSONObject objresult = new JSONObject();
	         String bmMid = String.valueOf(session.getAttribute("id"));
	         
	         String[] arr;
	  try {
	         List<Favorite> favoritelist = bmservice.favoriteList(bmMid);
	         List detaillist = new ArrayList();
	         for(int i=0; i< favoritelist.size(); i++) {
//	           String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//	           "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//	           "&contentTypeId=12&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//	    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//	            "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
//	            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//	    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//	            "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//	            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//	    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//	            "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//	            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
	            "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D"+
	            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
	    
	    
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
	       
	         
	         session.setAttribute("bmList", detaillist); //세션에도 저장_드래그시 이벤트관리용
	         List<JSONObject> bmList = (List<JSONObject>) session.getAttribute("bmList");
	      
	         
	         for(int i=1;i<=dayindex;i++) {
	        	 
	    			String day2 = "bmlist"; 
	    			day2 += String.valueOf(i);
	    			List<JSONObject> newbml = new ArrayList();
	    			for(int j=0;j<bmList.size();j++) {
	    				JSONObject imsi = new JSONObject();
	    				imsi.put("contentid", bmList.get(j).get("contentid"));
	    				imsi.put("contenttypeid", bmList.get(j).get("contenttypeid"));
	    				imsi.put("firstimage", bmList.get(j).get("firstimage"));
	    				imsi.put("mapx", bmList.get(j).get("mapx"));
	    				imsi.put("mapy", bmList.get(j).get("mapy"));
	    				imsi.put("title", bmList.get(j).get("title"));

	    				
	    				newbml.add(imsi);
	    				
	    			}
	    			session.setAttribute(day2, newbml);
	    			
	      			
	      		
	    		}
	         
	         model.addAttribute("count", favoritelist.size());
	         
	    }catch(Exception e) {
	   	 System.out.println(e);
	    }
	       
		       
			return "mytravel/myMakeMapModify";
		}
	
	
	
	@ResponseBody
	@RequestMapping(value = "addDetailTravel.mh")
	public void addDetailTravel(String dayindex,HttpSession session,HttpServletResponse res) {
		
	    List<Mark> list = (List<Mark>)session.getAttribute("travelday"+dayindex);
	    JSONObject result = new JSONObject();
	    JSONArray markList = new JSONArray();
	    	
	    for(int i=0;i<list.size();i++) {
	    	JSONObject obj = new JSONObject();
	    	obj.put("mapx", list.get(i).getMapx());
	    	obj.put("mapy", list.get(i).getMapy());
	    	obj.put("title", list.get(i).getTitle());
	    	obj.put("contenttypeid", list.get(i).getContenttypeid());
	    	markList.add(obj);
	    }
	    result.put("markList", markList);
	    
	    try {
			res.getWriter().print(result.toJSONString());
		} catch (IOException e) {

			e.printStackTrace();
		}
	       
		
	}
	
	

}
