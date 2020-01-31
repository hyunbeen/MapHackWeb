package maphack.infodetail.common;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class InfoDetail {
   
   String totalCount;      // 전체 레코드 수   
   
   //여행 정보 리스트를 불러오는 메소드
   public List areaBasedList(InfoVO vo) {
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//      String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//      String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
//      String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
     String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
      String info = "areaBasedList?";
      String param = "";
      
      vo.setNumOfRows("12");
//      vo.setPageNo("1");
      vo.setAreaCode("1");
 //     vo.setContentTypeId("12");
      vo.setListYN("Y");
      vo.setArrange("A");
//      vo.setCat1("");
//      vo.setCat2("");
//      vo.setCat3("");
      vo.setSigunguCode(vo.getSigunguCode());
      
      param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
            + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
            + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
            + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
            + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
            + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
            + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
            + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
            + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
            + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
            + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();
      
      param += "&_type=json";
      url += info + key + param;

      List list = new ArrayList();
      Map<String, String> map = null;

      JSONObject jo4 = json(url);      //공통로직 처리
      
      Pagination p = new Pagination();               //페이징 전용 객체 호출
      Map<String, String> m = new HashMap<>();
      m = p.pageCount(vo.getPageNo(), totalCount);      //페이징처리 메소드
      

      if(jo4 != null) {                              //items의 값이 존재할때
         if(jo4.get("item") instanceof JSONObject) {         //item의 타입이 JSONObject인지 확인(가져오는 데이터가 한개인지 여러개인지 구분)
            JSONObject ja1 = (JSONObject) jo4.get("item");


            map = (Map<String, String>) ja1;
            list.add(map);
         }else {
            JSONArray ja1 = (JSONArray) jo4.get("item");


            for(int i = 0; i < ja1.size(); i++) {
               map = (Map<String, String>) ja1.get(i);
               if(i == 0) {
                  map.put("pageNo", vo.getPageNo());
                  map.put("pageTotalCount", m.get("pageTotalCount"));
                  map.put("start", m.get("start"));
                  map.put("end", m.get("end"));
                  map.put("next", m.get("next"));
                  map.put("prev", m.get("prev"));
                  map.put("cnt", m.get("cnt"));
               }
               list.add(map);
            }
         }
      }
      return list;      
   }

   

   

   
   
   //여행 정보 지역코드를 불러오는 메소드
   public JSONArray areaCode(InfoVO vo) {
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//      String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//      String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
//      String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
      String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
      String info = "areaCode?";
      String param = "";
      
      vo.setNumOfRows("50");
      vo.setPageNo("1");
//      vo.setAreaCode("1");
//      vo.setContentTypeId("12");
//      vo.setListYN("Y");
//      vo.setArrange("A");
//      vo.setCat1("");
//      vo.setCat2("");
//      vo.setCat3("");
//      vo.setSigunguCode("");
      
      param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
            + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
            + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
            + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
            + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
            + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
            + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
            + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
            + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
            + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
            + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();
      
      param += "&_type=json";
      url += info + key + param;
  
      JSONObject jo4 = json(url);
      
      JSONArray ja1 = new JSONArray();

      if(jo4.get("item") instanceof JSONObject) {
    	  ja1.add(jo4.get("item"));
      }else {
    	  ja1 = (JSONArray) jo4.get("item");
      }
      return ja1;
      
            
   }
   
   
   
   //여행 정보 리스트를 검색조건에 맞게 불러오는 메소드
      public List searchKeyword(InfoVO vo) throws Exception{
         String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//         String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//         String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
//         String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
         String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
         String info = "searchKeyword?";
         String param = "";
         
         String keyword = URLEncoder.encode(vo.getKeyword(), "UTF-8");
         
         vo.setNumOfRows("12");
         vo.setPageNo("1");
//         vo.setAreaCode("1");
//         vo.setContentTypeId("12");
         vo.setListYN("Y");
         vo.setArrange("A");
//         vo.setCat1("");
//         vo.setCat2("");
//         vo.setCat3("");
//         vo.setSigunguCode(vo.getSigunguCode());
         vo.setKeyword(keyword);
         
         param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
               + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
               + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
               + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
               + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
               + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
               + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
               + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
               + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
               + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
               + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();
         
         param += "&_type=json";
         url += info + key + param;
         
         List list = new ArrayList();
         Map<String, String> map = null;

         JSONObject jo4 = json(url);
         Pagination p = new Pagination();               //페이징 전용 객체 호출
         Map<String, String> m = new HashMap<>();
         m = p.pageCount(vo.getPageNo(), totalCount);      //페이징처리 메소드
         

         if(jo4 != null) {                              //items의 값이 존재할때
            if(jo4.get("item") instanceof JSONObject) {         //item의 타입이 JSONObject인지 확인(가져오는 데이터가 한개인지 여러개인지 구분)
               JSONObject ja1 = (JSONObject) jo4.get("item");


               map = (Map<String, String>) ja1;
               list.add(map);
            }else {
               JSONArray ja1 = (JSONArray) jo4.get("item");
   

               for(int i = 0; i < ja1.size(); i++) {
                  map = (Map<String, String>) ja1.get(i);
                  if(i == 0) {
                     map.put("pageTotalCount", m.get("pageTotalCount"));
                     map.put("start", m.get("start"));
                     map.put("end", m.get("end"));
                     map.put("next", m.get("next"));
                     map.put("prev", m.get("prev"));
                     map.put("cnt", m.get("cnt"));
                  }
                  list.add(map);
               }
            }
         }
         return list;      
      }
      
   
   
   //여행정보 공통정보를 가져오는 메소드
   public Map<String, String> detailCommon(InfoVO vo) {
      
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//      String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//      String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
      String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
//      String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
//      String info = "areaBasedList?";
      vo.setInfo("detailCommon?");
      String info = vo.getInfo();
      String param = "";
      
      vo.setNumOfRows("12");
      vo.setPageNo("1");
//      vo.setAreaCode("1");
      vo.setContentTypeId(vo.getContentTypeId());
//      vo.setListYN("Y");
//      vo.setArrange("A");
//      vo.setCat1("");
//      vo.setCat2("");
//      vo.setCat3("");
//      vo.setSigunguCode("");
//      vo.setMapX("");
//      vo.setMapY("");
//      vo.setRadius("");
//      vo.setKeyword("");
//      vo.setEventStartDate("");
//      vo.setEventEndDate("");
//      vo.setHanOk("");
//      vo.setBenikia("");
//      vo.setGoodStay("");
      vo.setContentId(vo.getContentId());
      vo.setDefaultYN("Y");
      vo.setFirstImageYN("Y");
      vo.setAreacodeYN("Y");
      vo.setCatcodeYN("Y");
      vo.setAddrinfoYN("Y");
      vo.setMapinfoYN("Y");
      vo.setOverviewYN("Y");
//      vo.setIntroYN("");
//      vo.setDetailYN("");
//      vo.setImageYN("");
//      vo.setSubImageYN("");
      
      param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
            + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
            + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
            + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
            + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
            + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
            + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
            + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
            + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
            + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
            + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();
      
      param += "&_type=json";
      url += info + key + param;
     
      Map<String, String> map = null;

      JSONObject jo4 = json(url);
    
      JSONObject ja1 = (JSONObject) jo4.get("item");


      map = (Map<String, String>) ja1;
      
      return map;   
   }
   
   
   //여행정보 소개정보를 가져오는 메소드
   public Map<String, String> detailIntro(InfoVO vo) {

      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//               String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//               String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
               String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
//      String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
      //         String info = "areaBasedList?";
      vo.setInfo("detailIntro?");
      String info = vo.getInfo();
      String param = "";

      vo.setNumOfRows("12");
      vo.setPageNo("1");
      //         vo.setAreaCode("1");
      vo.setContentTypeId(vo.getContentTypeId());
      //         vo.setListYN("Y");
      //         vo.setArrange("A");
      //         vo.setCat1("");
      //         vo.setCat2("");
      //         vo.setCat3("");
      //         vo.setSigunguCode("");
      //         vo.setMapX("");
      //         vo.setMapY("");
      //         vo.setRadius("");
      //         vo.setKeyword("");
      //         vo.setEventStartDate("");
      //         vo.setEventEndDate("");
      //         vo.setHanOk("");
      //         vo.setBenikia("");
      //         vo.setGoodStay("");
      vo.setContentId(vo.getContentId());
      //         vo.setDefaultYN("Y");
      //         vo.setFirstImageYN("Y");
      //         vo.setAreacodeYN("Y");
      //         vo.setCatcodeYN("Y");
      //         vo.setAddrinfoYN("Y");
      //         vo.setMapinfoYN("Y");
      //         vo.setOverviewYN("Y");
      vo.setIntroYN("Y");
      //         vo.setDetailYN("");
      //         vo.setImageYN("");
      //         vo.setSubImageYN("");

      param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
      + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
      + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
      + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
      + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
      + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
      + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
      + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
      + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
      + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
      + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();

      param += "&_type=json";
      url += info + key + param;

      Map<String, String> map = null;

      JSONObject jo4 = json(url);

      JSONObject ja1 = (JSONObject) jo4.get("item");

      map = (Map<String, String>) ja1;

      return map;   
   }
      
      
      
      //여행 정보 반복정보를 불러오는 메소드
   public List detailInfo(InfoVO vo) {
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//                  String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//                  String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
                  String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
//      String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
      vo.setInfo("detailInfo?");
      String info = vo.getInfo();
      String param = "";

      vo.setNumOfRows("12");
      vo.setPageNo("1");

      //            vo.setAreaCode("1");
      vo.setContentTypeId(vo.getContentTypeId());
      vo.setListYN("Y");
      //            vo.setArrange("A");
      //            vo.setCat1("");
      //            vo.setCat2("");
      //            vo.setCat3("");
      //            vo.setSigunguCode("");
      //            vo.setMapX("");
      //            vo.setMapY("");
      //            vo.setRadius("");
      //            vo.setKeyword("");
      //            vo.setEventStartDate("");
      //            vo.setEventEndDate("");
      //            vo.setHanOk("");
      //            vo.setBenikia("");
      //            vo.setGoodStay("");
      vo.setContentId(vo.getContentId());
      //            vo.setDefaultYN("Y");
      //            vo.setFirstImageYN("Y");
      //            vo.setAreacodeYN("Y");
      //            vo.setCatcodeYN("Y");
      //            vo.setAddrinfoYN("Y");
      //            vo.setMapinfoYN("Y");
      //            vo.setOverviewYN("Y");
      //            vo.setIntroYN("Y");
      //            vo.setDetailYN("");
      //            vo.setImageYN("");
      //            vo.setSubImageYN("");

      param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
      + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
      + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
      + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
      + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
      + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
      + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
      + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
      + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
      + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
      + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();

      param += "&_type=json";
      url += info + key + param;
   
      List list = new ArrayList();
      Map<String, String> map = null;

      JSONObject jo4 = json(url);

      if(jo4 != null) {
         if(jo4.get("item") instanceof JSONObject) {
            JSONObject ja1 = (JSONObject) jo4.get("item");


            map = (Map<String, String>) ja1;
            list.add(map);
         }else {
            JSONArray ja1 = (JSONArray) jo4.get("item");


            for(int i = 0; i < ja1.size(); i++) {
               map = (Map<String, String>) ja1.get(i);
           
               list.add(map);
            }
         }
      }
      return list;      
   }
         
         
         
         //여행 정보 추가이미지를 불러오는 메소드
   public List detailImage(InfoVO vo) {
      String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/";
//                  String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";   //종상
//                  String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";      //재만
                  String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";   //현빈
//      String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";   //아름
      vo.setInfo("detailImage?");
      String info = vo.getInfo();
      String param = "";

      vo.setNumOfRows("12");
      vo.setPageNo("1");
      vo.setMobileOS("ETC");
      vo.setMobileApp("TourAPI3.0_Guide");
      //            vo.setAreaCode("1");
      vo.setContentTypeId(vo.getContentTypeId());
      //            vo.setListYN("Y");
      //            vo.setArrange("A");
      //            vo.setCat1("");
      //            vo.setCat2("");
      //            vo.setCat3("");
      //            vo.setSigunguCode("");
      //            vo.setMapX("");
      //            vo.setMapY("");
      //            vo.setRadius("");
      //            vo.setKeyword("");
      //            vo.setEventStartDate("");
      //            vo.setEventEndDate("");
      //            vo.setHanOk("");
      //            vo.setBenikia("");
      //            vo.setGoodStay("");
      vo.setContentId(vo.getContentId());
      //            vo.setDefaultYN("Y");
      //            vo.setFirstImageYN("Y");
      //            vo.setAreacodeYN("Y");
      //            vo.setCatcodeYN("Y");
      //            vo.setAddrinfoYN("Y");
      //            vo.setMapinfoYN("Y");
      //            vo.setOverviewYN("Y");
      //            vo.setIntroYN("Y");
      //            vo.setDetailYN("");
      vo.setImageYN("Y");
      vo.setSubImageYN("Y");

      param += "&areaCode=" + vo.getAreaCode() + "&contentTypeId=" + vo.getContentTypeId()
      + "&cat1=" + vo.getCat1() + "&cat2=" + vo.getCat2() + "&cat3=" + vo.getCat3()
      + "&listYN=" + vo.getListYN() + "&arrange=" + vo.getArrange() + "&sigunguCode=" + vo.getSigunguCode()
      + "&mapX=" + vo.getMapX() + "&mapY=" + vo.getMapY() + "&radius=" + vo.getRadius()
      + "&keyword=" + vo.getKeyword() + "&eventStartDate=" + vo.getEventStartDate() + "&eventEndDate=" + vo.getEventEndDate()
      + "&hanOk=" + vo.getHanOk()   + "&benikia=" + vo.getBenikia()   + "&goodStay=" + vo.getGoodStay()
      + "&contentId=" + vo.getContentId() + "&defaultYN=" + vo.getDefaultYN() + "&firstImageYN=" + vo.getFirstImageYN()
      + "&areacodeYN=" + vo.getAreacodeYN() + "&catcodeYN=" + vo.getCatcodeYN() + "&addrinfoYN=" + vo.getAddrinfoYN()
      + "&mapinfoYN=" + vo.getMapinfoYN() + "&overviewYN=" + vo.getOverviewYN() + "&introYN=" + vo.getIntroYN()
      + "&detailYN=" + vo.getDetailYN() + "&imageYN=" + vo.getImageYN() + "&subImageYN=" + vo.getSubImageYN()
      + "&numOfRows=" + vo.getNumOfRows() + "&pageNo=" + vo.getPageNo() + "&MobileOS=" + vo.getMobileOS()   + "&MobileApp=" + vo.getMobileApp();

      param += "&_type=json";
      url += info + key + param;
   
      List list = new ArrayList();
      Map<String, String> map = null;

      JSONObject jo4 = json(url);
      if(jo4 != null) {
         if(jo4.get("item") instanceof JSONObject) {
            JSONObject ja1 = (JSONObject) jo4.get("item");


            map = (Map<String, String>) ja1;
            list.add(map);
         }else {
            JSONArray ja1 = (JSONArray) jo4.get("item");


            for(int i = 0; i < ja1.size(); i++) {
               map = (Map<String, String>) ja1.get(i);
             
               list.add(map);
            }
         }
      }
      return list;      
   }
   
   
   
   public JSONObject json(String url) {
      StringBuffer jsonSb = new StringBuffer();
      JSONParser jp = new JSONParser();
      JSONObject jo1, jo2, jo3, jo4 = null;
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



        
         
         jp = new JSONParser();
         jo1 = (JSONObject) jp.parse(jsonSb.toString());
         jo2 = (JSONObject) jo1.get("response");

         jo3 = (JSONObject) jo2.get("body");

         totalCount = jo3.get("totalCount").toString();

         
         
         jo4 = (JSONObject) jo3.get("items");

      } catch (Exception e) {
         e.printStackTrace();
      }

      return jo4;

   }
   
   
   

}