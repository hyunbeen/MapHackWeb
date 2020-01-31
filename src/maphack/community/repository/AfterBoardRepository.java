package maphack.community.repository;


import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
//import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;
import org.w3c.dom.css.Counter;

import maphack.travelmap.dto.Favorite;
import maphack.travelmap.dto.SeqTravel;
import maphack.travelmap.dto.TravelMap;

@Repository
public class AfterBoardRepository {
   @Autowired
   private SqlSessionTemplate ss;
   @Autowired
   private MongoTemplate mongo;
   
   //여행정보공유 리스트
   public List<JSONObject> afterBoardList(){
//	   Query query = new Query();
//	   query.addCriteria(Criteria.where("map_id").is(m_id));
	   List<JSONObject> afterList  = mongo.findAll(JSONObject.class, "travelinfoshare");
	   return afterList;
   }

   //여행정보공유 작성
   public int afterBoardInsert(JSONObject jo) {
	   mongo.insert(jo,"travelinfoshare");
	   int result = 1;
	   return result;
   }
   
   //여행정보공유 상세보기
   public JSONObject afterDetail(String pageNum) {
	   Query query = new Query();
	   query.addCriteria(Criteria.where("_id").is(pageNum));
	   return (JSONObject) mongo.findOne(query, JSONObject.class, "travelinfoshare");
   }
   
}