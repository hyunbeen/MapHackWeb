package maphack.travelmap.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class TravelMapRepository {
   @Autowired
   private SqlSessionTemplate ss;
   @Autowired
   private MongoTemplate mongo;
   
   public int insertFavorite(String iLocation,String id) {
	   HashMap hash = new HashMap();
		  hash.put("mid", id);
		  hash.put("bmIlocation",iLocation);
      int favorite = ss.insert("travelMap.insertFavorite",hash);
      
      return favorite;
   }
   
   
   
   public int deleteFavorite(String iLocation,String id) {
	   HashMap hash = new HashMap();
		  hash.put("mid", id);
		  hash.put("bmIlocation",iLocation);
      int favorite = ss.delete("travelMap.deleteFavorite", hash);
      
      return favorite;
   }
   
   public List<Favorite> favoriteList(String bmMid){
  	
     List<Favorite> list = ss.selectList("travelMap.selectFavorite", bmMid);
     return list;
}
   public int insertTravel(TravelMap tm) {
//	   if(!tm.getMap_mapnum().equals("1")) {
//		   String map_num = tm.getMap_mapnum();
//		   map_num = String.valueOf(Integer.valueOf(tm.getMap_mapnum())+1);
//		   tm.setMap_mapnum(map_num);
//	   }
	   Query query = new Query();
	   query.addCriteria(Criteria.where("_id").is("seq_post"));
	   Update update = new Update();
	   update.inc("seq",1);
	   FindAndModifyOptions options = new FindAndModifyOptions();
	   options.upsert(true);
	   SeqTravel sequence = mongo.findAndModify(query, update, options, SeqTravel.class,"seq");
	   System.out.println("seq : "+sequence.getSeq());
	   tm.setMap_mapnum(String.valueOf(sequence.getSeq()));
	   mongo.insert(tm,"travelmap");
	   int result = 1;
	   return result;
   }
   
}