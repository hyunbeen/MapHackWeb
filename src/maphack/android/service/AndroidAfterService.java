package maphack.android.service;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.android.repository.AndroidAfterRepository;
import maphack.travelmap.dto.TravelMap;


@Service
public class AndroidAfterService {

	@Autowired
	private AndroidAfterRepository repo;
		
	//리뷰 조회
	public List<JSONObject>  getAfterTravel() {
		List<JSONObject> info = repo.getAfterTravel();
		return info;
	}
	
	public List<TravelMap>  getTravel(String id) {
		List<TravelMap> info = repo.getTravel(id);
		

		return info;
	}
	
	   
}
