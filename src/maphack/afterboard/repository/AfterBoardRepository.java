package maphack.afterboard.repository;

import java.util.List;

import maphack.afterboard.dto.TravelAfter;
import maphack.afterboard.dto.TravelMap;
import maphack.infodetail.dto.Member;

public class AfterBoardRepository {
	//여행후기 리스트 보여주기
	public List<TravelAfter> travelAfterList(){
		List<TravelAfter> list = null;
		return list;
	}
	
	//여행후기 검색하기
	public List<TravelAfter> travelAfterSearchList(String cate,String searchText){
			List<TravelAfter> list = null;
			return list;
	}
	
	//여행후기 상세
	public TravelAfter travelAfterDetail(TravelAfter travel){
		TravelAfter ta = null;
		return ta;
	}
	
	//여행후기 수정
	public TravelAfter travelAfterModify(TravelAfter travel){
			TravelAfter ta = null;
			return ta;
	}
	
	//여행후기 삭제
	public void travelAfterDelete(TravelAfter travel){
			
	}
		
	//여행후기 삽입
	public void travelAfterInsert(TravelAfter travel){
	
	}
	
	//여행후기에서 여행지도 가져오기
	public List<TravelMap> travelAfterBring(Member member){
		List<TravelMap> list = null;
		return list;
		
	}
	
	//여행후기리뷰 수정
	public TravelAfter travelAfterReviewModify(TravelAfter travel){
				TravelAfter ta = null;
				return ta;
	}
		
	//여행후기리뷰 삭제
	public void travelAfterReviewDelete(TravelAfter travel){
				
	}
			
	//여행후기리뷰 삽입
	public void travelAfterReviewInsert(TravelAfter travel){
		
	}
		
}
