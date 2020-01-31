package maphack.freeboard.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import maphack.freeboard.dto.FreeBoard;
import maphack.freeboard.dto.FreeBoardReview;
import maphack.infodetail.dto.Member;



@Repository
public class FreeBoardRepository {
	
		@Autowired
		private SqlSessionTemplate ss;
		
		//자유게시판 list 보기
		public List<FreeBoard> freeBoardList(FreeBoard freeBoard){
			List<FreeBoard> list = ss.selectList("freeBoard.freeSelect", freeBoard);
			return list;
		}
		//자유게시판 상세보기
		public FreeBoard freeBoardView(FreeBoard freeBoard){
			FreeBoard freeBoardOne = ss.selectOne("freeBoard.freeOneSelect", freeBoard);;
			return freeBoardOne;
		}
		//자유게시판 수정
		public void freeBoardModify(FreeBoard board , Member member){
			
		}
		//자유게시판 삭제
		public void freeBoardDelete(FreeBoard board , Member member){
			
		}
		//자유게시판 삽입
		public int freeBoardInsert(FreeBoard freeBoard){
			
			//네임스페이스.sql아이디, 파라메터
			int result = ss.insert("freeBoard.freeInsert", freeBoard);
			
			return result;
			
			
		}
		//자유게시판 리뷰리스트보기
		
		public List<FreeBoardReview> freeBoardReviewList(FreeBoard board){
				List<FreeBoardReview> list = null;
				return list;
		}
		
		//자유게시판 수정
				public void freeBoardReviewModify(FreeBoardReview board , Member member){
					
				}
				//자유게시판 삭제
				public void freeBoardReviewDelete(FreeBoardReview board , Member member){
					
				}
				//자유게시판 삽입
				public void freeBoardReviewInsert(FreeBoardReview board , Member member){
					
				}
				
}
