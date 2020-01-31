package maphack.travelmap.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
//import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import maphack.travelmap.dto.MapGroup;
import maphack.travelmap.dto.Member;
import maphack.travelmap.dto.MongoTravel;

@Repository
public class GroupMapRepository {
   @Autowired
   private SqlSessionTemplate ss;
   @Autowired
   private MongoTemplate mt;
   //멤버 리스트 가져오기
   public List<Member> listMember(){
      List<Member> list = ss.selectList("travelMap.listMember");
      
     
     
      return list;
   }
   //그룹멤버 가져오기
   public MapGroup[] groupMember(){
	   MongoTravel tm = new MongoTravel();
	      MongoTravel tmlist = new MongoTravel();
	      Query query = new Query();
	      query.addCriteria(Criteria.where("_id").is("1"));
	      //query.addCriteria(Criteria.where("map_group").elemMatch(Criteria.where("map_send_mid").is("lhb")));
	      tmlist = mt.findOne(query,MongoTravel.class,"travelmap");
	      MapGroup[] mapgroup = tmlist.getMap_group();
	     
	     
	      return mapgroup;
	}
 

   
}