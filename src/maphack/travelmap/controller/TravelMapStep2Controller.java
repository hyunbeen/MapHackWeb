package maphack.travelmap.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import maphack.infodetail.common.InfoDetail;
import maphack.mypage.dto.Favorite;
import maphack.mypage.service.MyPageService;
import maphack.travelmap.dto.DayMark;
import maphack.travelmap.dto.Mark;
import maphack.travelmap.dto.TravelMap;
import maphack.travelmap.service.TravelMapService;



@Controller
public class TravelMapStep2Controller {
	@Autowired
	private InfoDetail infoDetail;
   @Autowired
   private TravelMapService service;
   //지도만들기 시작
   @Autowired
   private MyPageService bmservice;
     
   @RequestMapping(value = "step2.mh")
   public String test2(Model model, HttpSession session) {

 
       int dayindex = (Integer)session.getAttribute("dayindex");
       int realindex = (Integer)session.getAttribute("dayindex");
       session.setAttribute("realday", realindex); //원래 날짜 인덱스
       dayindex = dayindex+5; //예비일자 확보
         List<Mark> dl  = (List<Mark>) session.getAttribute("dragList");
      
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
       session.removeAttribute("dragList"); // step1 드래그리스트 세션제거
       
       
       
       
       
       
       //즐겨찾기 데이터
       
       System.out.println("즐찾 컨트롤러타기");
		JSONObject objresult = new JSONObject();
         String bmMid = "omy";
         
         String[] arr;
  try {
         List<Favorite> favoritelist = bmservice.favoriteList(bmMid);
         List detaillist = new ArrayList();
         for(int i=0; i< favoritelist.size(); i++) {
//           String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//           "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//           "&contentTypeId=12&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//            "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
//            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//            "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//    String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//            "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//            "&contentId="+favoritelist.get(i).getBmIlocation()+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
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
         System.out.println("bml"+bmList);
         
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
    				System.out.println(newbml);
    			}
    			session.setAttribute(day2, newbml);
    			
      			
      		
    		}
         
         model.addAttribute("count", favoritelist.size());
         
    }catch(Exception e) {
   	 System.out.println(e);
    }
       
       
       
       
       
      return "makemap/step2";
   }

   //파일업로드
   @ResponseBody
   @RequestMapping(value = "requestupload.mh")

   public String requestupload(MultipartHttpServletRequest multi) throws Exception{

	// 저장 경로 설정
       String root = multi.getSession().getServletContext().getRealPath("/");
       String path = "C:\\Users\\KOSTA\\git\\TravelMap\\MapHack\\WebContent\\upload\\";
       System.out.println(multi); 
       File dir = new File("C:\\Users\\KOSTA\\git\\TravelMap\\MapHack\\WebContent\\upload\\");
       if(!dir.isDirectory()){
           dir.mkdir();
       }
        
       Iterator<String> files = multi.getFileNames();
       System.out.println("파일스"+ files);
       while(files.hasNext()){
    	   System.out.println("와일문 들어왓나");
           String uploadFile = files.next();
           
           MultipartFile mFile = multi.getFile(uploadFile);
           String fileName = mFile.getOriginalFilename();
         
          
           System.out.println("실제 파일 이름 : " +fileName);
//        System.out.println("권재만");
    	   if(fileName.length()!=0) {
           try {
        	 
               mFile.transferTo(new File(path+fileName));
        	   
           } catch (Exception e) {
               e.printStackTrace();
           }
    	   }
       }
       return "업로드 성공";

	}
	   


	   

   
   
   
   //step2 드래그 세션 이벤트
   @RequestMapping(value = "dragEvent.mh")
   @ResponseBody
   public void dragEvent(int index, String day, int listtype, HttpSession session, HttpServletResponse hsr) {
      
	  System.out.println("리스트타입"+ listtype);
	   
	if(listtype==1) { //드래그된 리스트가 1이라면
	String str = "list";
	str = str+day;
   List<Mark> dragList= (List<Mark>)session.getAttribute(str);

   dragList.remove(index);
   

   session.setAttribute(str, dragList);
   JSONObject obj = new JSONObject();
   List<JSONObject> jsonList = new ArrayList();
   for(int i=0;i<dragList.size();i++) {
	   JSONObject imsi = new JSONObject();
	   imsi.put("contentid", dragList.get(i).getContentid());
	   imsi.put("contenttypeid", dragList.get(i).getContenttypeid());
	   imsi.put("firstimage", dragList.get(i).getFirstimage());
	   imsi.put("mapx", dragList.get(i).getMapx());
	   imsi.put("mapy", dragList.get(i).getMapy());
	   imsi.put("title", dragList.get(i).getTitle());


	   jsonList.add(imsi);
   }
   
   obj.put("dragList",jsonList);
	     
 
//   session.setAttribute("index", index );
   try {
   hsr.getWriter().print(obj);
} catch (IOException e) {
   e.printStackTrace();
}
   
	}//선택된 리스트 1일때 종료
	
	else if(listtype==2) { 
		System.out.println("type2");
		
		String str = "bmlist";
		str = str+day;
	   List<JSONObject> bmList= (List<JSONObject>)session.getAttribute(str);

	   bmList.remove(index);
	   

	   session.setAttribute(str, bmList);
	   JSONObject obj = new JSONObject();
	   List<JSONObject> jsonList = new ArrayList();
	   for(int i=0;i<bmList.size();i++) {
		   JSONObject imsi = new JSONObject();
		   imsi.put("contentid", bmList.get(i).get("contentid"));
			imsi.put("contenttypeid", bmList.get(i).get("contenttypeid"));
			imsi.put("firstimage", bmList.get(i).get("firstimage"));
			imsi.put("mapx", bmList.get(i).get("mapx"));
			imsi.put("mapy", bmList.get(i).get("mapy"));
			imsi.put("title", bmList.get(i).get("title"));


		   jsonList.add(imsi);
	   }
	   
	   obj.put("bmList",jsonList);
		     
	 
	//   session.setAttribute("index", index );
	   try {
	   hsr.getWriter().print(obj);
	} catch (IOException e) {
	   e.printStackTrace();
	}
		
		
		
	}
   
   }
  
   @RequestMapping(value = "deletesession.mh")
   @ResponseBody
   public void createvalue(Model model, HttpSession session) {
    	
      
     
         
   }

   @RequestMapping(value = "sendDay.mh")
   @ResponseBody
   public void sendday( HttpSession session, int dayindex, String startdate, String enddate) {
    	//맵서치에서 에서 쓸 탭숫자
	   session.setAttribute("dayindex", dayindex);
	   session.setAttribute("startdate", startdate);
	   session.setAttribute("enddate", enddate);
        for(int i=0; i<dayindex; i++) {
        	String day = "list";
  			day += String.valueOf(i);
  			session.removeAttribute(day);
        }
	   
   }
     
   //지도짜기 insert (몽고 mongo)
   @RequestMapping(value = "inserttravel.mh", method = {RequestMethod.POST})
   @ResponseBody
   public String inserttravel(@RequestBody String paramData, HttpSession session) {
    	//맵서치에서 에서 쓸 탭숫자
	   System.out.println("컨트롤러 탓고");
	   System.out.println("파람데이터"+ paramData);

	   String startdate = (String)session.getAttribute("startdate");
	   String map_fname;
	   
	   JSONParser parser = new JSONParser();
	   Object obj;
	   TravelMap tm = new TravelMap();
	   
	   try {
		obj = parser.parse(paramData);
		
		JSONObject jsonobj = (JSONObject)obj;
		String map_title= String.valueOf(jsonobj.get("map_title")); //맵타이틀
		
		
		
		
	

		if(String.valueOf(jsonobj.get("map_fname")).equals("파일선택")) {
			map_fname = "no_detail_img.gif";
		}
		else {
			map_fname = String.valueOf(jsonobj.get("map_fname")); //메인사진
		}
		String map_id = String.valueOf(session.getAttribute("id")); //작성자
		
		
		System.out.println("맵타이틀" + map_title);
		
		tm.setMap_title(map_title); 
		tm.setMap_fname("/MapHack/upload/"+map_fname);

		tm.setMap_id(map_id);
		
		
		JSONArray ja = (JSONArray)jsonobj.get("map_day_list");
		   List<DayMark> daymarkList = new ArrayList<DayMark>();
		 for(int i=0; i<ja.size() ; i++) {
			 
			 JSONObject jo = (JSONObject)ja.get(i);
			 
			 JSONArray ja2 = (JSONArray)jo.get("map_date");
			 
			  DayMark daymark =new DayMark();
			  List<Mark> markList = new ArrayList<Mark>();
			  
			  
			 for(int j=0; j<ja2.size(); j++) {
				 Mark mark = new Mark();
				 JSONObject jo2 = (JSONObject) ja2.get(j);
				 String firstimage =String.valueOf(jo2.get("firstimage"));
				 String title = String.valueOf(jo2.get("title"));
				 int contentid = Integer.parseInt(String.valueOf(jo2.get("contentid")));
				 int contenttypeid = Integer.parseInt(String.valueOf(jo2.get("contenttypeid")));
				 double mapx = Double.parseDouble(String.valueOf(jo2.get("mapx")));
				 double mapy = Double.parseDouble(String.valueOf(jo2.get("mapy")));
				 String content = String.valueOf(jo2.get("content"));
				 String time = String.valueOf(jo2.get("time"));
				 String alramtime = String.valueOf(jo2.get("alramtime"));
				 
				 if(!(time.equals("")) && !(alramtime.equals(""))) {
					 System.out.println("타임하고 알람 안넣엇는데 들어왓나");
					 
				 time=  time.replace( ":", "-");	 
				 time = startdate+"-"+ time;
				 
				 SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
			
				 Date start = transFormat.parse(time);
				 start.setDate(start.getDate()+i);
				 
				 Calendar cal = Calendar.getInstance();
				 cal.setTime(start);
				 cal.add(Calendar.MINUTE, -(Integer.parseInt(alramtime)));
				 time = transFormat.format(cal.getTime());
				 
				 System.out.println("타이틀: "+ title + "콘텐트 : "+ content + " 변경된 알람값"+ time);
				 }
//				 
				 
				 mark.setFirstimage(firstimage);
				 mark.setTitle(title);
				 mark.setContentid(contentid);
				 mark.setContenttypeid(contenttypeid);
				 mark.setMapx(mapx);
				 mark.setMapy(mapy);
				 mark.setContent(content);
				 mark.setTime(time);
				 mark.setAlramtime(alramtime);
//				 mark.setAlramtime(transFormat.format(start));
				 
				 markList.add(mark);
			 }
			 daymark.setMap_date(markList);
			 daymarkList.add(daymark);
		 }
		 tm.setMap_day_list(daymarkList); 
		 System.out.println(tm.getMap_day_list().get(0).getMap_date().get(0).getTitle());
		 System.out.println(tm.getMap_day_list().get(0).getMap_date().get(0).getTime());

		 int result = service.insertTravel(tm);
		

		   
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (java.text.ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	   
	   
	   
	   
	   
//	   	System.out.println(">>?"+tm.getMap_title());
//	   	System.out.println(">>?"+tm.getMap_day_list().get(0).getMap_date().size());
//	 
//	   	int result = service.insertTravel(tm);
//	   	System.out.println("여행짜기 삽입 : "+result);
	   	return "ok";
        }
	   
   
   
}
   




