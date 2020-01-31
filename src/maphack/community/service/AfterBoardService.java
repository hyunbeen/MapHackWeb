package maphack.community.service;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.community.repository.AfterBoardRepository;
import maphack.travelmap.dto.Favorite;
import maphack.travelmap.dto.TravelMap;
import maphack.travelmap.repository.TravelMapRepository;

@Service
public class AfterBoardService {
   @Autowired
   private AfterBoardRepository repository;
  
 
//   public List<JSONObject> favoriteList(String bmMid){
		 
//	      List<JSONObject> list = new ArrayList();
//	      List<Favorite> favoriteList = repository.favoriteList(bmMid);
//	      for(int i=0;i<favoriteList.size();i++) {
//	    	  JSONObject obj = new JSONObject();
//	    	  obj.put("favoriteLocation", favoriteList.get(i).getBmIlocation());
//	    	 
//	    	  list.add(obj);
//	      }
//	     
//	     
//	      return list;
//	 }
   
   //여행정보공유 삽입
   public int afterBoardInsert(JSONObject jo) {
	   int result = repository.afterBoardInsert(jo);
	   return result;
   }
   
   //여행정보공유 리스트
   public List<JSONObject> afterBoardList(){
	   return repository.afterBoardList();
   }
   
   //여행정보공유 상세보기
   public JSONObject afterDetail(String pageNum) {
	   return repository.afterDetail(pageNum);
   }
   
   
}