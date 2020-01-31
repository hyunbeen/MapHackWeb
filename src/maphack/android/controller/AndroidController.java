package maphack.android.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.android.dto.DayMark;
import maphack.android.dto.Mark;
import maphack.android.dto.Member;
import maphack.android.dto.TravelMap;
import maphack.android.service.AndroidAlarmService;
import maphack.android.service.AndroidLoginService;
import maphack.travelmap.service.TravelMapService;


@Controller
public class AndroidController {
	@Autowired
	private TravelMapService service;
	@Autowired
	private AndroidLoginService service1;
	@Autowired
	private AndroidAlarmService service2;


	@RequestMapping("android.mh")
	@ResponseBody
	public void androidTestWithRequest(HttpServletRequest request, HttpServletResponse response){
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("memo"));

		//	        Map<String, String> result = new HashMap<String, String>();
		//	        result.put("data1", "메모");
		//	        result.put("data2", "와하우");

		JSONObject objresult = new JSONObject();

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
		//		String key = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";
		//			          String key = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";
			          String key = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";
//		String key = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";
		String param = "&contentTypeId=12&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=5&pageNo=1&_type=json";
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
				//				String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
				//						"ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
				//						"&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
				//					                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
				//					                        "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
				//					                        "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
					                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
					                        "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
					                        "&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//				String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//						"ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//						"&contentTypeId=12&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
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
			objresult.put("list", list);	            
			objresult.put("detaillist", detaillist);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String url1 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
		//		String key1 = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";
		//			          String key1 = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";
			          String key1 = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";
//		String key1 = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";
		String param1 = "&contentTypeId=32&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=5&pageNo=1&_type=json";
		url1 += key1 + param1;

		StringBuffer jsonSb1 = new StringBuffer();

		try {
			URL u = new URL(url1);
			InputStream is = u.openStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

			String line = "";
			while((line = br.readLine())!=null) {
				jsonSb1.append(line);
			}
			br.close();
			is.close();


			JSONParser jp = new JSONParser();
			JSONObject jo1 = (JSONObject) jp.parse(jsonSb1.toString());
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
				//				String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
				//						"ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
				//						"&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
				//					                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
				//					                        "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
				//					                        "&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
					                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
					                        "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
					                        "&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//				String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//						"ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//						"&contentTypeId=32&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
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
			objresult.put("list1", list);	            
			objresult.put("detaillist1", detaillist);
		} catch (Exception e) {
			e.printStackTrace();
		}



		String url2 = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
		//		String key2 = "ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D";
		//			          String key2 = "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D";
			          String key2 = "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D";
//		String key2 = "ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D";
		String param2 = "&contentTypeId=39&areaCode=1&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=5&pageNo=1&_type=json";
		url2 += key2 + param2;

		StringBuffer jsonSb2 = new StringBuffer();

		try {
			URL u = new URL(url2);
			InputStream is = u.openStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

			String line = "";
			while((line = br.readLine())!=null) {
				jsonSb2.append(line);
			}
			br.close();
			is.close();


			JSONParser jp = new JSONParser();
			JSONObject jo1 = (JSONObject) jp.parse(jsonSb2.toString());
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
				//				String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
				//						"ServiceKey=%2BXmsGVm%2FLMAYzIv%2FNgrbZApb0jtyYdmvBjKjRwbFhhJ1j68F%2FZ4liLhxn8G5DWtx0tKLuUKi%2FeRzXAja94NEcw%3D%3D"+
				//						"&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
				//					                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
				//					                        "ServiceKey=VlIuZMT6O8XXOigY86QDxNkRQnewWQQ7FJBaxPgldVoT0l6WTeK3y0wA0zr02BpqwP7xvGJhPJdbuiDzq8ErcQ%3D%3D"+
				//					                        "&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
					                String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
					                        "ServiceKey=m4cjuQdu8UTyQd1%2BsR8jvrAGLgC0D59YmrfVF%2BQUSMKnfMo7W%2F%2FuvgKeA%2FdV5BsWNx%2FwTykuf6q9G361gH%2BtdQ%3D%3D"+
					                        "&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
//				String detailurl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"+
//						"ServiceKey=veF8iiPL4qd1xHi0GlgQx%2F8LwHbKKkDwp%2FgVDljHgViCdLR1AH6hmeWmP8hagF9cdUbKWP%2BCX6feQSkbld9jBw%3D%3D"+
//						"&contentTypeId=39&contentId="+conid+"&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
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
			objresult.put("list2", list);	            
			objresult.put("detaillist2", detaillist);
		} catch (Exception e) {
			e.printStackTrace();
		}


		//		String bmMid = "omy";
		//
		//		List<JSONObject> favoritelist = service.favoriteList(bmMid);      
		//		objresult.put("favoritelist", favoritelist);



		try {

			response.getWriter().print(objresult.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	@RequestMapping(value = "androidloginconfirm.mh")
	public void loginConfirm(Model model, Member member, HttpServletResponse response, HttpServletRequest request) {
		member.setmId(request.getParameter("id"));
		member.setmPass(request.getParameter("pw"));

		int loginconfirm = service1.loginConfirm(member);

		String confirm = Integer.toString(loginconfirm);


		try {
			response.getWriter().print(confirm);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "androidalarm.mh")
	public void alarm(Model model, Member member, HttpServletResponse response, HttpServletRequest request) {
		member.setmId(request.getParameter("id"));


		List<TravelMap> travelList = service2.alarmList(member.getmId());
		System.out.println(member.getmId());

		JSONObject result = new JSONObject();

		JSONArray jrrtravel = new JSONArray();

		for(int i=0;i<travelList.size();i++) {
			TravelMap tm = travelList.get(i);
			JSONObject upupobj = new JSONObject();
			JSONArray upjarr = new JSONArray();
			for(int j=0;j<tm.getMap_day_list().size();j++) {
				DayMark dm = tm.getMap_day_list().get(j);
				List<Mark> markList = dm.getMap_date();

				JSONObject upobj = new JSONObject();
				JSONArray jarr = new JSONArray();
				for(int k=0;k<markList.size();k++) {
					Mark mark = markList.get(k);
					JSONObject obj = new JSONObject();
					obj.put("alarmtime",mark.getAlramtime());
					obj.put("content",mark.getContent());
					obj.put("contentid",mark.getContentid());
					obj.put("contenttypeid",mark.getContenttypeid());
					obj.put("firstimage",mark.getFirstimage());
					obj.put("mapx",mark.getMapx());
					obj.put("mapy",mark.getMapy());
					obj.put("time",mark.getTime());
					obj.put("title",mark.getTitle());
					jarr.add(obj);

				}
				upobj.put("markList", jarr);
				upjarr.add(upobj);
			}
			upupobj.put("dayList", upjarr);
			upupobj.put("map_title", tm.getMap_title());
			upupobj.put("map_id", tm.getMap_id());
			upupobj.put("map_fname", tm.getMap_fname());
			upupobj.put("map_num", tm.getMap_mapnum());
			jrrtravel.add(upupobj);
		}
		result.put("travelmaplist",jrrtravel);
		//		JSONObject jsonObject = new JSONObject();
		//		jsonObject.put("alarm", travelList);


		try {
			response.getWriter().print(result.toJSONString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
