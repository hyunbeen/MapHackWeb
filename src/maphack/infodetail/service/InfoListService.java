package maphack.infodetail.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.infodetail.common.InfoVO;
import maphack.infodetail.dto.InfoReview;
import maphack.infodetail.repository.InfoListRepository;


@Service
public class InfoListService {

	@Autowired
	private InfoListRepository repo;
	
	//리뷰 등록
	public int infoReviewInsert(InfoReview review){
		int result = repo.infoReviewInsert(review);
		return result;
	}
	
	//리뷰 조회
	public List<InfoReview> infoReviewList(InfoVO vo) {
		return repo.infoReviewList(vo);
	}
	
	//리뷰 수정
	public int infoReviewUpdate(InfoReview review) {
		int result = repo.infoReviewModify(review);
		return result;
	}
	   
}
