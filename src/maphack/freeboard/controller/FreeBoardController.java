package maphack.freeboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import maphack.freeboard.dto.FreeBoard;
import maphack.freeboard.service.FreeBoardService;
import maphack.infodetail.common.Pagination;


@Controller
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	
	//자유게시판 list 페이지
		@RequestMapping(value = "freeBoardList.mh")
		public String freeList(FreeBoard freeBoard, Model model, String pageNo) {
			
			
		if(pageNo == null) {
			
			pageNo = "1";
			
		}
			System.out.println("pageNo" + pageNo);
			
			List<FreeBoard> list = freeBoardService.freeBoardList(freeBoard);

			
			Pagination pagination = new Pagination();
			
		
			
			Map<String, String> map = pagination.pageCount(pageNo, String.valueOf(list.size()));
			
			freeBoard.setStart(Integer.parseInt(map.get("startRow")));
			freeBoard.setEnd(Integer.parseInt(map.get("endRow")));
			
			System.out.println("start" + freeBoard.getStart() + "end" + freeBoard.getEnd());
			
			model.addAttribute("freePaging", map);
			List<FreeBoard> pList = freeBoardService.freeBoardList(freeBoard);
			model.addAttribute("freeBoardList", pList); //list라는 값을 freeBoardList라는 화면에 전달
			model.addAttribute("free", "freeBoardList");

			
			
			return "freeboard/freeBoardList";
		}
		
		
		//자유게시판 작성페이지 
		@RequestMapping(value = "freeBoard.mh")
		public String freeBoard(Model model) {
			
				
		
			return "freeboard/freeBoard";
		
	}
		//자유게시판 상세페이지 
				@RequestMapping(value = "freeView.mh")
				public String freeView(String id,HttpSession session) {
					FreeBoard idFreeBoard = new FreeBoard();
					idFreeBoard.setbNum(id);
					FreeBoard detailView = freeBoardService.freeBoardView(idFreeBoard);
					session.setAttribute("detailView", detailView);
				
					return "freeboard/freeView";
				
			}
				
				//자유게시판 수정페이지 
				@RequestMapping(value = "freeModifyView.mh")
				public String freeModifyView(String id,HttpSession session) {
					FreeBoard idFreeBoard = new FreeBoard();
					idFreeBoard.setbNum(id);
					FreeBoard detailView = freeBoardService.freeBoardView(idFreeBoard);
					session.setAttribute("detailView", detailView);
				
					return "freeboard/freeModifyView";
				
			}
		
		
		//자유게시판 작성완료시 Service 호출
		@RequestMapping(value = "insertFree.mh")
		public String insertFree(FreeBoard freeBoard, Model model) {
			
			int result = freeBoardService.freeBoardInsert(freeBoard);
			
			List<FreeBoard> list = freeBoardService.freeBoardList(freeBoard);

			model.addAttribute("freeBoardList", list); //list라는 값을 freeBoardList라는 화면에 전달
			model.addAttribute("free", "freeBoardList");
			
			

			System.out.println("자유게시판 작성 저장버튼 컨트롤러" + result);
			
			return "freeboard/freeBoardList";
	}
		
		
	
	
}
