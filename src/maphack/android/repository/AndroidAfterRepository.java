package maphack.android.repository;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import maphack.travelmap.dto.TravelMap;
//로그인 서비스
@Repository
public class AndroidAfterRepository {
	@Autowired
	   private MongoTemplate mongo;
	
	public List<JSONObject> getAfterTravel(){
			Query query = new Query();

			
			
			List<JSONObject> info  = (List<JSONObject>) mongo.find(query,JSONObject.class,"travelinfoshare");
			return info;
	   }
	
	public List<TravelMap> getTravel(String id){
		Query query = new Query();
		

		query.addCriteria(Criteria.where("map_id").is(id));
		
		
		List<TravelMap> info  = (List<TravelMap>) mongo.find(query,TravelMap.class,"travelmap");
		
		return info;
   }
	
}


