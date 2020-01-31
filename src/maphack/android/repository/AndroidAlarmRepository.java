package maphack.android.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import maphack.android.dto.Member;
import maphack.android.dto.User;
import maphack.android.dto.TravelMap;
//로그인 서비스
@Repository
public class AndroidAlarmRepository {
	@Autowired
	   private SqlSessionTemplate ss;
	
	@Autowired
	private MongoTemplate mt;
	
	public List<TravelMap> alarmList(String m_id) {
		
	      
	      Query query = new Query();
	    
	      query.addCriteria(Criteria.where("map_id").is(m_id));
	      //query.addCriteria(Criteria.where("map_group").elemMatch(Criteria.where("map_send_mid").is("lhb")));
	      List<TravelMap> alarmList  = mt.find(query,TravelMap.class,"travelmap");
	      
	     
	     
	      return alarmList;
	}
}
