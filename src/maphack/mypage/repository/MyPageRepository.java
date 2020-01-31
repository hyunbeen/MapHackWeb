package maphack.mypage.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
//import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import maphack.mypage.dto.Favorite;
import maphack.mypage.dto.TravelMap;

@Repository
public class MyPageRepository {
	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private MongoTemplate mt;
	
	public List<Favorite> favoriteList(String bmMid){
	  	
	     List<Favorite> list = ss.selectList("myPage.selectFavorite", bmMid);
	     return list;
	}
	public List<TravelMap> travelList(String m_id) {
			
	      
	      Query query = new Query();
	    
	      query.addCriteria(Criteria.where("map_id").is(m_id));
	
	      List<TravelMap> travelList  = mt.find(query,TravelMap.class,"travelmap");
	      
	     
	     
	      return travelList;
	}
	
	
}
