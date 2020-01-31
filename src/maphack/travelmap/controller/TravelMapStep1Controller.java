package maphack.travelmap.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

import maphack.infodetail.common.InfoDetail;
import maphack.travelmap.dto.Favorite;
import maphack.travelmap.dto.Mark;
import maphack.travelmap.service.TravelMapService;



@Controller
public class TravelMapStep1Controller {
   @Autowired
   private InfoDetail infoDetail;
   @Autowired
   private TravelMapService service;
   //지도만들기 시작

   //지도만들기 시작
      @RequestMapping(value = "step1.mh")
      public String test() {

         return "makemap/step1";
      }
   
       
      @RequestMapping(value = "mapAddData.mh")
      @ResponseBody
      public void mapAddData(Model model,Model model2,Model model3, HttpServletResponse servletresponse) {
         JSONObject objresult = new JSONObject();
         
          String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
//          String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";
//          String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";
//          String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";
          String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";
//             String key = "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D";
          String param = "&contentTypeId=12&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=2&pageNo=1&_type=json";
          url += key + param;
          
          StringBuffer jsonSb = new StringBuffer();
          
          try {
             URL u = new URL(url);
             InputStream is = u.openStream();
             BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
             
             String line = "";
             while((line = br.readLine())!=null) {
                jsonSb.append(line);
             }
             br.close();
             is.close();
             

             JSONParser jp = new JSONParser();
             JSONObject jo1 = (JSONObject) jp.parse(jsonSb.toString());
             JSONObject jo2 = (JSONObject) jo1.get("response");
             JSONObject jo3 = (JSONObject) jo2.get("body");
             JSONObject jo4 = (JSONObject) jo3.get("items");
             JSONArray ja1 = (JSONArray) jo4.get("item");
             
             List list = new ArrayList();
             List detaillist = new ArrayList();
             for(int i = 0; i < ja1.size(); i++) {
                Map<String, String> map = (Map<String, String>) ja1.get(i);
                list.add(map);
                
                JSONObject obj =(JSONObject)map;
                
                String conid = obj.get("contentid").toString();
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                       "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//                       "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                        "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
//                        "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                        "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//                        "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
                        "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
                        "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                      "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D"+
//                      "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
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
             model.addAttribute("list", list);
             
             objresult.put("list", list);
             model.addAttribute("detaillist", detaillist);
            
             objresult.put("detaillist", detaillist);
          } catch (Exception e) {
             e.printStackTrace();
          }
          
 
          String bmMid = "omy";
          
          String[] arr;
   
          List<JSONObject> favoritelist = new ArrayList();
          //favoritelist = service.favoriteList(bmMid);
 
          arr = new String[(favoritelist.size())];
  
          
    
          objresult.put("favoritelist", favoritelist);
//         
//          
          try {
        
         servletresponse.getWriter().print(objresult.toJSONString());
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
          

          
         
      }
      

      @RequestMapping(value = "mapHomeData.mh")
      @ResponseBody
      public void mapHomeData(Model model,Model model2,Model model3, HttpServletResponse response) {
         JSONObject objresult = new JSONObject();
         
          
          
        
          String url2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
//          String key2 = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";
//          String key2 = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";
//          String key2 = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";
          String key2 = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";
//           String key2 = "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D";

          String param2 = "&contentTypeId=32&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=2&pageNo=1&_type=json";
          url2 += key2 + param2;
          
          StringBuffer jsonSb2 = new StringBuffer();
          
          try {
             URL u2 = new URL(url2);
             InputStream is2 = u2.openStream();
             BufferedReader br2 = new BufferedReader(new InputStreamReader(is2, "UTF-8"));
             
             String line2 = "";
             while((line2 = br2.readLine())!=null) {
                jsonSb2.append(line2);
             }
             br2.close();
             is2.close();
             

             JSONParser jp2 = new JSONParser();
             JSONObject jo111 = (JSONObject) jp2.parse(jsonSb2.toString());
             JSONObject jo222 = (JSONObject) jo111.get("response");
             JSONObject jo333 = (JSONObject) jo222.get("body");
             JSONObject jo444 = (JSONObject) jo333.get("items");
             JSONArray ja111 = (JSONArray) jo444.get("item");
             
             List list2 = new ArrayList();
             List detaillist = new ArrayList();
             for(int i = 0; i < ja111.size(); i++) {
                Map<String, String> map2 = (Map<String, String>) ja111.get(i);
                list2.add(map2);
                
                JSONObject obj =(JSONObject)map2;
                
                String conid = obj.get("contentid").toString();
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                       "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//                       "&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                      "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
//                        "&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                        "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//                        "&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
                        "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
                        "&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                        "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D"+
//                        "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
                
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
             model3.addAttribute("list2", list2);
             objresult.put("list2", list2);
             model3.addAttribute("detaillist2", detaillist);
             objresult.put("detaillist2", detaillist);
            
          
          } catch (Exception e) {
             e.printStackTrace();
          }
          
 
          String bmMid = "omy";
          
          String[] arr;
   
          List<JSONObject> favoritelist = new ArrayList();
          //favoritelist = service.favoriteList(bmMid);
 
          arr = new String[(favoritelist.size())];
  
          
    
          objresult.put("favoritelist", favoritelist);
         
          
          try {
        
         response.getWriter().print(objresult.toJSONString());
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
          

          
         
      }
     
      

     
      @RequestMapping(value = "mapFoodData.mh")
         @ResponseBody
         public void mapFoodData(Model model,Model model2,Model model3, HttpServletResponse servletresponse) {
            JSONObject objresult = new JSONObject();
             String url1 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
//             String key1 = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";
//             String key1 = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";
//             String key1 = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";
             String key1 = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";
//            String key1 = "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D";

             String param1 = "&contentTypeId=39&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=2&pageNo=1&_type=json";
             url1 += key1 + param1;
             
             StringBuffer jsonSb1 = new StringBuffer();
             
             try {
                URL u1 = new URL(url1);
                InputStream is1 = u1.openStream();
                BufferedReader br1 = new BufferedReader(new InputStreamReader(is1, "UTF-8"));
                
                String line1 = "";
                while((line1 = br1.readLine())!=null) {
                   jsonSb1.append(line1);
                }
                br1.close();
                is1.close();
                

                JSONParser jp1 = new JSONParser();
                JSONObject jo11 = (JSONObject) jp1.parse(jsonSb1.toString());
                JSONObject jo22 = (JSONObject) jo11.get("response");
                JSONObject jo33 = (JSONObject) jo22.get("body");
                JSONObject jo44 = (JSONObject) jo33.get("items");
                JSONArray ja11 = (JSONArray) jo44.get("item");
                
                List list1 = new ArrayList();
                List detaillist = new ArrayList();
                for(int i = 0; i < ja11.size(); i++) {
                   Map<String, String> map1 = (Map<String, String>) ja11.get(i);
                   list1.add(map1);
                   
                   JSONObject obj =(JSONObject)map1;
                   
                   String conid = obj.get("contentid").toString();
//                   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                          "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
//                          "&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                         "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
//                           "&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                           "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
//                           "&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
                   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
                           "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
                           "&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//                   String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//                           "ServiceKey=Ku9RuBH0xJcGRcpcA1s%2B42PkQNLkOkqeHFdheFgEhnrl9L2JLPHgqEd24MzCLzZw3z1uThaZgbBAZm4xpmQDuQ%3D%3D"+
//                           "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
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
                model2.addAttribute("list1", list1);
            
                objresult.put("list1", list1);
                model2.addAttribute("detaillist1", detaillist);
                
                objresult.put("detaillist1", detaillist);
                
             } catch (Exception e) {
                e.printStackTrace();
             }
    
   
             String bmMid = "omy";
             
             String[] arr;
      
             List<JSONObject> favoritelist = service.favoriteList(bmMid);

     
             arr = new String[(favoritelist.size())];
     
             
       
             objresult.put("favoritelist", favoritelist);
            
             
             try {
                
            servletresponse.getWriter().print(objresult.toJSONString());
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
             

             
            
         }
      
      
      @RequestMapping(value = "favorite.mh")
      @ResponseBody
      public String favorite(Favorite favorite,HttpSession session) {
    	  String announce = "";
    	  if(session.getAttribute("id")==null) {
     		 announce = "에러발생";
     		 return announce;
     	 }
    	 String id = String.valueOf(session.getAttribute("id"));
    	 int insertfavorite = service.insertFavorite(favorite.getBmIlocation(),id);
         
    	 
    	
         
         if(insertfavorite >= 0) {
            announce = "등록완료";
         }else {
            announce = "에러발생";
         }
         return announce;
      }
      
      @RequestMapping(value = "favoritedel.mh")
      @ResponseBody
      public String favoritedel(Favorite favorite,HttpSession session) {
    	  String id = String.valueOf(session.getAttribute("id"));
         int insertfavorite = service.deleteFavorite(favorite.getBmIlocation(),id);
         String announce = "";
         if(insertfavorite >= 0) {
            announce = "해제완료";
         }else {
            announce = "에러발생";
         }
         return announce;
      }
      
   
      
      @RequestMapping(value = "addMarker.mh")
      @ResponseBody
      public String addMarker(Mark mark,HttpSession session){
        List<Mark> markList = (List<Mark>) session.getAttribute("dragList");
        if(markList == null) {
           markList = new ArrayList();
           markList.add(mark);
        }else {
           markList.add(mark);
        }
        session.setAttribute("dragList", markList);
      return "성공";
      }
      
      @RequestMapping(value = "deleteMarker.mh")
      @ResponseBody
      public String deleteMarker(Mark mark,HttpSession session){
         List<Mark> markList = (List<Mark>) session.getAttribute("dragList");
         if(markList != null) {
             for(int i=0;i<markList.size();i++) {
                if(markList.get(i).getContentid() == mark.getContentid()) {
                   markList.remove(i);
                }
             }
          }
         session.setAttribute("dragList", markList);
      return "성공";
      }
      
      
      @RequestMapping(value = "dayChoice.mh")
      public String dayChoice(){
         
      return "makemap/dayChoice";
      }
      
      
      
      
      @RequestMapping(value = "selectFavoriteData.mh")
      @ResponseBody
      public void selectFavoriteData(HttpServletResponse servletresponse) {
         JSONObject objresult = new JSONObject();
      
         List<JSONObject> favoritelist = new ArrayList();
         //favoritelist = service.favoriteList(bmMid);
          objresult.put("favoritelist", favoritelist);
         
          
          try {
             
         servletresponse.getWriter().print(objresult.toJSONString());
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
          

          
         
      }
      
      
      
  
}