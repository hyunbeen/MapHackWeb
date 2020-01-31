package maphack.android.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.android.dto.Member;
import maphack.android.repository.AndroidAlarmRepository;
import maphack.android.dto.TravelMap;


@Service
public class AndroidAlarmService {

	@Autowired
	private AndroidAlarmRepository repo;
		
	//리뷰 조회
	   public List<TravelMap> alarmList(String m_id) {
		   
		   List<TravelMap> alarmList = repo.alarmList(m_id);
		   return alarmList;
		   
	   }
	

	   
}
