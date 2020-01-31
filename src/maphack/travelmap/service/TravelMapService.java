package maphack.travelmap.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.travelmap.dto.Favorite;
import maphack.travelmap.dto.TravelMap;
import maphack.travelmap.repository.TravelMapRepository;

@Service
public class TravelMapService {
   @Autowired
   private TravelMapRepository repository;
  
 
   public int insertFavorite(String iLocation,String id) {
	  
	  
      int favorite = repository.insertFavorite(iLocation,id);
      
      return favorite;
   }
   

   
   public int deleteFavorite(String iLocation,String id) {
      int favorite = repository.deleteFavorite(iLocation,id);
      
      return favorite;
   }
   public List<JSONObject> favoriteList(String bmMid){
		 
	      List<JSONObject> list = new ArrayList();
	      List<Favorite> favoriteList = repository.favoriteList(bmMid);
	      for(int i=0;i<favoriteList.size();i++) {
	    	  JSONObject obj = new JSONObject();
	    	  obj.put("favoriteLocation", favoriteList.get(i).getBmIlocation());
	    	 
	    	  list.add(obj);
	      }
	     
	     
	      return list;
	 }
   
   //여행짜기 삽입
   public int insertTravel(TravelMap tm) {
	   int result = repository.insertTravel(tm);
	   return result;
   }
   
   
}