package maphack.infodetail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.infodetail.common.InfoVO;
import maphack.infodetail.common.Pagination;
import maphack.infodetail.dto.InfoReview;
import maphack.infodetail.service.InfoListService;

@Controller
public class InfoReviewController {
	
	@Autowired
	private InfoListService service;
	
	//리뷰 등록
	@RequestMapping(value="insertReview.mh")
	@ResponseBody
	public void insertReview(String pageNo, InfoVO vo, InfoReview infoReview, Model model, HttpServletResponse response) {
		service.infoReviewInsert(infoReview);	//등록
		
		if(pageNo == null) {
			pageNo = "1";
		}
		
		vo.setContentId(infoReview.getIrLocation());
		List<InfoReview> list = service.infoReviewList(vo);		//리뷰 목록 가져오기
		
		Pagination p = new Pagination();
		Map<String, String> map = p.pageCount(pageNo, String.valueOf(list.size()));		//페이징
		vo.setStart(Integer.parseInt(map.get("startRow")));			//리스트가 시작될 부분
		vo.setEnd(Integer.parseInt(map.get("endRow")));				//리스트가 끝날 부분
		System.out.println("test : " + vo.getStart() + "/" + vo.getEnd());
		List<InfoReview> list2 = service.infoReviewList(vo);		//한페이지에 출력할 값만 가져옴
		
		List<JSONObject> rList = new ArrayList<>();
		
		for(int i = 0; i < list2.size(); i++) {
			JSONObject jo = new JSONObject();
			if(i==0) {
				map.put("contentId", vo.getContentId());
				map.put("contentTypeId", vo.getContentTypeId());
				jo.putAll(map);
			}
			jo.put("irMid", list2.get(i).getIrMid());
			jo.put("irStar", list2.get(i).getIrStar());
			jo.put("irLocation", list2.get(i).getIrLocation());
			jo.put("irContent", list2.get(i).getIrContent());
			jo.put("irDate", list2.get(i).getIrDate());
			jo.put("irNum", list2.get(i).getIrDate());
			rList.add(jo);
		}
		JSONArray ja = new JSONArray();
		ja.addAll(rList);
		
		try {
			response.getWriter().print(ja.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//리뷰 수정
	@RequestMapping(value = "updateReview.mh")
	@ResponseBody
	public void updateReview(String pageNo, InfoReview infoReview, HttpServletResponse response) {
		System.out.println("넘어옴");
		int result = service.infoReviewUpdate(infoReview);
		
		if(pageNo == null) {
			pageNo = "1";
		}
		
		InfoVO vo = new InfoVO();
		vo.setContentId(infoReview.getIrLocation());
		List<InfoReview> list = service.infoReviewList(vo);
		
		Pagination p = new Pagination();
		Map<String, String> map = p.pageCount(pageNo, String.valueOf(list.size()));		//페이징
		vo.setStart(Integer.parseInt(map.get("startRow")));			//리스트가 시작될 부분
		vo.setEnd(Integer.parseInt(map.get("endRow")));				//리스트가 끝날 부분
		System.out.println("test : " + vo.getStart() + "/" + vo.getEnd());
		List<InfoReview> list2 = service.infoReviewList(vo);		//한페이지에 출력할 값만 가져옴
		
		List<JSONObject> rList = new ArrayList<>();
		
		for(int i = 0; i < list2.size(); i++) {
			JSONObject jo = new JSONObject();
			if(i==0) {
				map.put("contentId", vo.getContentId());
				map.put("contentTypeId", vo.getContentTypeId());
				jo.putAll(map);
			}
			jo.put("irMid", list2.get(i).getIrMid());
			jo.put("irStar", list2.get(i).getIrStar());
			jo.put("irLocation", list2.get(i).getIrLocation());
			jo.put("irContent", list2.get(i).getIrContent());
			jo.put("irDate", list2.get(i).getIrDate());
			jo.put("irNum", list2.get(i).getIrDate());
			rList.add(jo);
		}
		JSONArray ja = new JSONArray();
		ja.addAll(rList);
		
		
		
//		JSONArray rList = new JSONArray();
//		
//		for(InfoReview review : list) {
//			JSONObject jo = new JSONObject();
//			jo.put("irMid", review.getIrMid());
//			jo.put("irStar", review.getIrStar());
//			jo.put("irLocation", review.getIrLocation());
//			jo.put("irContent", review.getIrContent());
//			jo.put("irDate", review.getIrDate());
//			jo.put("irNum", review.getIrDate());
//			rList.add(jo);
//		}
		try {
			response.getWriter().print(rList.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
