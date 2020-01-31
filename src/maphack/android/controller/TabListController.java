package maphack.android.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.android.service.AndroidAfterService;
import maphack.travelmap.dto.TravelMap;

@Controller
public class TabListController {

	@Autowired
	private AndroidAfterService service2;
	 @RequestMapping("tabList.mh")
	 @ResponseBody
	    public void androidTestWithRequest(HttpServletRequest request,HttpServletResponse res){
	        System.out.println("안드로이드 탔다");
	        List<JSONObject> result = service2.getAfterTravel();
	        System.out.println(result.size());
	        System.out.println("안드로이드 보낸다");
	        JSONArray jrr =new JSONArray();
	        for(int i=0;i<4;i++) {
	        	JSONObject jobj = result.get(i);
	        	jrr.add(jobj);
	        }
	        JSONObject send = new JSONObject();
	        send.put("result",jrr);
	        try {
//	        	if(send.toJSONString().length()>100) {
//	        		for(int i=0;i<send.toJSONString().length();i=i+100) {
//	        			res.getWriter().print(send.toJSONString().substring(i, i+100));
//	        		}
//	        	}
				res.getWriter().print(send.toJSONString());
			} catch (IOException e) {
		
				e.printStackTrace();
			}
	    }
	 
	 
	 @RequestMapping("mapList.mh")
	 @ResponseBody
	    public void androidTestWithRequest2(HttpServletRequest request,HttpServletResponse res){
	        System.out.println("안드로이드 탔다");
	        String id = String.valueOf(request.getParameter("id"));
	        System.out.println(id);
	        List<TravelMap> result = service2.getTravel(id);
	    
	        JSONArray jrr =new JSONArray();
	    
	        
	        for(int i=0;i<result.size();i++) {
	        	TravelMap travel = new TravelMap();
	        	travel = result.get(i);
	        	JSONObject json = new JSONObject();
	        	json.put("map_title", travel.getMap_title());
	        	json.put("_id",travel.getMap_mapnum());
	        	json.put("map_fname", travel.getMap_fname());
	        	jrr.add(json);
	        }
	        JSONObject send = new JSONObject();
	        send.put("result",jrr);
	        System.out.println("안드로이드 보낸다");
	        try {

	        	System.out.println("omy 보내기");
				res.getWriter().print(send.toJSONString());
				System.out.println("안드로이드 보낸다");
			} catch (IOException e) {
		
				e.printStackTrace();
			}
	    }
	 
	
	 
	 

	
}
