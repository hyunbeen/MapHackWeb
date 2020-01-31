package maphack.myafter.repository;

import java.util.List;

import maphack.myafter.dto.Member;
import maphack.myafter.dto.TravelAfter;
import maphack.myafter.dto.TravelMap;

public class MyAfterRepository {
	//마이페이지 여행후기 리스트 보여주기
	public List<TravelAfter> travelAfterList(Member member){
		List<TravelAfter> list = null;
		return list;
	}
	
	//마이페이지 여행후기 검색하기
	public List<TravelAfter> travelAfterSearchList(Member member,String cate,String searchText){
			List<TravelAfter> list = null;
			return list;
	}
	
	//마이페이지 여행후기 상세
	public TravelAfter travelAfterDetail(Member member,TravelAfter travel){
		TravelAfter ta = null;
		return ta;
	}
	
	//마이페이지 여행후기 수정
	public TravelAfter travelAfterModify(Member member,TravelAfter travel){
			TravelAfter ta = null;
			return ta;
	}
	
	//마이페이지 여행후기 삭제
	public void travelAfterDelete(Member member,TravelAfter travel){
			
	}
		
	//마이페이지 여행후기 삽입
	public void travelAfterInsert(Member member,TravelAfter travel){
	
	}
	
	//마이페이지 여행후기 삽입에서 여행지도 가져오기
	public List<TravelMap> travelAfterBring(Member member){
		List<TravelMap> list = null;
		return list;
		
	}
	
		
}
