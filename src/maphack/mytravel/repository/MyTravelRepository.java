package maphack.mytravel.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import maphack.mytravel.dto.Member;
import maphack.travelmap.dto.TravelMap;
@Repository
public class MyTravelRepository {
	@Autowired
	MongoTemplate mt;
	//등록된 여행지도 불러오기
	public List<TravelMap> listTravelMap(Member member){
		List<TravelMap> list = null;
		return list;
	}
	
	
		public TravelMap ViewTravelMap(Member member,TravelMap travel){
			TravelMap map = null;
			return map;
		}
		//등록된 상세 불러오기
		public TravelMap myMakeMapDetail(String id) {
			System.out.println("찾는 id : "+id);
			TravelMap tm = new TravelMap();
			
			Query query = new Query();
			
			query.addCriteria(Criteria.where("_id").is(id));
			tm  = mt.findOne(query,TravelMap.class,"travelmap");
			
			return tm;
		}
}
