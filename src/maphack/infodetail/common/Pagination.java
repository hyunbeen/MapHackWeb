package maphack.infodetail.common;

import java.util.HashMap;
import java.util.Map;

public class Pagination {
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 12;	// 한페이지당 레코드 수
	private int pageCount = 5;		// 페이지 번호 개수
	
	int groupNum;					//그룹번호
	int gFirstNum;					//그룹별 시작번호
	int gEndNum;					//그룹별 끝 번호
	int prevPage;					//이전페이지
	int nextPage;					//다음페이지
	
	String pageNum;

	public void getGroup(String pageNum){
		
		int pNum = 1;	//현재 페이지
		if(pageNum != "") {pNum = Integer.parseInt(pageNum);}
		
		groupNum = pNum / pageCount + (pNum % pageCount > 0? 1:0);	//그룹번호 계산
		gEndNum = groupNum * pageCount;									//현재 그룹에서 마지막 페이지 번호
		gFirstNum = gEndNum - (pageCount - 1);							//현재 그룹에서 첫번째 페이지 번호
		prevPage = pNum - 1;												//이전페이지 번호
		nextPage = pNum + 1;												//다음페이지 번호
		
		//그룹의 끝번호가 총 페이지 수보다 클경우 끝번호를 총 페이지 수로 지정
		if(gEndNum > pageTotalCount) {
			gEndNum = pageTotalCount;
		}
		//이전 페이지가 1보다 작을 경우 1로 고정
		if(prevPage < 1) {
			prevPage = 1;
		}
		//다음페이지가 총 페이지수보다 클경우 총 페이지 수로 고정
		if(nextPage > pageTotalCount) {
			nextPage = pageTotalCount;
		}
		
	}
	
	public void getTotalCount(){		
		pageTotalCount = totalRecCount / countPerPage;					//전체 페이지 수를 나타냄(전체 레코드 / 기준)
		if(totalRecCount % countPerPage > 0) {pageTotalCount++;}			//나머지가 있을 경우 나타내지 못한 페이지가 있는것이므로 한페이지 추가
		
	}

	
	//페이징 구현하는 메소드
	public Map<String, String> pageCount(String pageNo, String totalCount) {

		totalRecCount = Integer.parseInt(totalCount);
		
		int pNum = 1;
		pageNum = pageNo;
		if(pageNum != "") {
			pNum = Integer.parseInt(pageNum);
		}
		
		int firstRow = pNum * countPerPage - (countPerPage - 1);
		int endRow = pNum * countPerPage;
		
		getTotalCount();
		getGroup(pageNum);
		
		Map<String, String> map = new HashMap<>();
		map.put("pageTotalCount", String.valueOf(pageTotalCount));
		map.put("start", String.valueOf(gFirstNum));
		map.put("end", String.valueOf(gEndNum));
		map.put("next", String.valueOf(nextPage));
		map.put("prev", String.valueOf(prevPage));
		map.put("cnt", String.valueOf(countPerPage));
		map.put("startRow", String.valueOf(firstRow));
		map.put("endRow", String.valueOf(endRow));
		return map;
	}

	
}
