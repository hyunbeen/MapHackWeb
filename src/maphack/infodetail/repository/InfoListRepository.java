package maphack.infodetail.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import maphack.infodetail.common.InfoDetail;
import maphack.infodetail.common.InfoVO;
import maphack.infodetail.dto.InfoReview;
import maphack.infodetail.dto.Member;


@Repository
public class InfoListRepository {
   
   @Autowired
   private SqlSessionTemplate ss;
   
   
   //리스트 띄우기
   public List<InfoDetail> infoList(){
      List<InfoDetail> list = null;
      return list;
   }
   //리스트 검색 조건으로 검색
   public List<InfoDetail> infoSearchList(String cate,String searchText){
      List<InfoDetail> list = null;
      return list;
   }
   //리스트 상세 띄우기
   public InfoDetail infoDetail(InfoDetail info) {
      InfoDetail detail = null;
      return detail;
   }
   //리스트 즐겨찾기 추가
   public void infoFavor(InfoDetail info,Member member) {
      InfoDetail detail = null;
   }
   //리스트 좋아요,추천 업데이트 
   public void infoUpdate(InfoDetail info,Member member) {
      InfoDetail detail = null;
   }
   //리뷰띄우기
   public List<InfoReview> infoReviewList(InfoVO vo){
      Map<String, String> map = new HashMap<String, String>();
      map.put("irLocation", vo.getContentId());
      map.put("start", String.valueOf(vo.getStart()));
      map.put("end", String.valueOf(vo.getEnd()));
      List<InfoReview> list = ss.selectList("infoDetail.reviewSelect", map);
      return list;
   }
   //리뷰등록
   public int infoReviewInsert(InfoReview review){
      int result = ss.insert("infoDetail.reviewInsert", review);
      return result;
   }
   //리뷰수정
   public int infoReviewModify(InfoReview review){
	   int result = ss.update("infoDetail.reviewUpdate", review);
	   return result;
   }
   //리뷰삭제
   public void infoReviewDelete(InfoReview review,Member member,InfoDetail info){
      
   }

   
}