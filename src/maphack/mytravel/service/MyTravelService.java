package maphack.mytravel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.mytravel.dto.Member;
import maphack.travelmap.dto.TravelMap;
import maphack.mytravel.repository.MyTravelRepository;
@Service
public class MyTravelService {
	@Autowired
	MyTravelRepository repository;
	
	//등록된 여행지도 불러오기
	public List<TravelMap> listTravelMap(Member member){
		List<TravelMap> list = null;
		return list;
	}
	
	
		
		//등록된 상세 불러오기
		public TravelMap myMakeMapDetail(String id) {
			TravelMap tm = new TravelMap();
			System.out.println("service id : "+id);
			tm = repository.myMakeMapDetail(id);
			return tm;
		}
}
