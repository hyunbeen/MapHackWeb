package maphack.infodetail.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import maphack.infodetail.common.InfoDetail;
import maphack.infodetail.common.InfoVO;
import maphack.infodetail.common.Pagination;
import maphack.infodetail.dto.InfoReview;
import maphack.infodetail.service.InfoListService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class InfoDetailController {
	
	@RequestMapping(value = "home.mh", method = RequestMethod.GET)
	public String home(Model model) {		
		return "home";
	}
	
	@Autowired
	private InfoDetail infoDetail;
	
	@Autowired
	private InfoListService service;
	
	//여행정보 리스트 
	@RequestMapping(value="infoList.mh")
	public String infoList(InfoVO infoVO, Model model) {
		
		

		model.addAttribute("list", infoDetail.areaBasedList(infoVO));
		model.addAttribute("info", "infoList");
		System.out.println(infoDetail.areaBasedList(infoVO));
		return "infodetail/infoList";
		
	}
	
	
	//여행정보 지역코드
	@RequestMapping(value="areaCode.mh", produces = "application/json; charset=utf-8")	//ResponseBody로 데이터 전송 시 인코딩처리(없어도됨)
	@ResponseBody
	public void areaCode(InfoVO infoVO, HttpServletResponse response) {
		
		String result = infoDetail.areaCode(infoVO).toString();

		
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//여행정보 검색조건별 리스트 
		@RequestMapping(value="searchKeyword.mh")
		public String searchKeyword(InfoVO infoVO, Model model) {
			
			

			try {
				model.addAttribute("list", infoDetail.searchKeyword(infoVO));
				model.addAttribute("info", "searchKeyword");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "infodetail/infoList";
			
		}
	
	
	//여행정보 상세보기
	@RequestMapping(value="infoDetail.mh")
	public String infoDetail(String pageNo, InfoVO infoVO, Model model) {
		
		if(pageNo == null) {
			pageNo = "1";
		}
	

//		model.addAttribute("list", infoDetail.test3(infoVO));
		model.addAttribute("common", infoDetail.detailCommon(infoVO));
		model.addAttribute("intro", infoDetail.detailIntro(infoVO));
		model.addAttribute("info", infoDetail.detailInfo(infoVO));
		model.addAttribute("image", infoDetail.detailImage(infoVO));
		
		List<InfoReview> rList = service.infoReviewList(infoVO);
		Pagination p = new Pagination();
		Map<String, String> map = p.pageCount(pageNo, String.valueOf(rList.size()));
		
		map.put("contentId", infoVO.getContentId());
		map.put("contentTypeId", infoVO.getContentTypeId());
		model.addAttribute("rPaging", map);
		infoVO.setStart(Integer.parseInt(map.get("startRow")));
		infoVO.setEnd(Integer.parseInt(map.get("endRow")));
		model.addAttribute("rList", service.infoReviewList(infoVO));
		model.addAttribute("infoDetail", "infoDetail");
		
		return "infodetail/infoDetail";
		
	}
	
	
		//여행 후기 작성페이지 지도모달창에 여행정보 리스트
		@RequestMapping(value="modelMapList.mh")
		public void infoList(InfoVO infoVO, HttpServletResponse response) {
			
			List list = infoDetail.areaBasedList(infoVO);
			JSONArray ja = new JSONArray();
			ja.addAll(list);
			try {
				response.getWriter().print(ja.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//여행 후기 작성페이지 지도모달창에 여행정보 검색조건별 리스트 
		@RequestMapping(value="modelSearchKeyword.mh")
		public void searchKeyword(InfoVO infoVO, HttpServletResponse response) {
			try {
			List list = infoDetail.searchKeyword(infoVO);
			JSONArray ja = new JSONArray();
			ja.addAll(list);
			response.getWriter().print(ja.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}


		}
	
}
