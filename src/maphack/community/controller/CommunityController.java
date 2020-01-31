package maphack.community.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import maphack.community.service.AfterBoardService;


@Controller
public class CommunityController {

   @Autowired
   private AfterBoardService service;
   
   //여행정보공유(후기) list(정보공유 카테고리 main화면)
   @RequestMapping(value = "afterBoardList.mh")
   public String afterBoardList(Model model) {
      
      List<JSONObject> afterList = service.afterBoardList();
      System.out.println(afterList.toString());
      
      model.addAttribute("afterList", afterList);
      
      System.out.println("afterBoardListController");
      return "community/afterBoardList";
   }


   //여행정보공유(후기) 작성 페이지 (여행정보후기 리스트 -> 새 글 등록)
   @RequestMapping(value = "afterBoard.mh")
   public String board(Model model) {      
      System.out.println("afterBoardListController");
      return "community/afterBoard";
   }

   
   //여행정보공유(후기) 작성페이지에서 저장버튼 클릭시
      @RequestMapping(value = "afterFileUpload.mh")
      @ResponseBody
      public void afterFileUpload(MultipartHttpServletRequest multi) {
         
         // 저장 경로 설정
           File dir = new File("C:\\Users\\KOSTA\\git\\TravelMap\\MapHack\\WebContent\\upload2\\");
           if(!dir.isDirectory()){
               dir.mkdir();
           }
            
           Iterator<String> files = multi.getFileNames();
           while(files.hasNext()){
               String uploadFile = files.next();
   
               MultipartFile mFile = multi.getFile(uploadFile);
               String fileName = mFile.getOriginalFilename();
                   if(fileName != "") {
                  System.out.println("실제 파일 이름 : " +fileName);
                  try {
                     mFile.transferTo(new File("C:\\Users\\KOSTA\\git\\TravelMap\\MapHack\\WebContent\\upload2\\" + fileName));
                  } catch (Exception e) {
                     e.printStackTrace();
                  }
               }
           }
//           return "파일 업로드가 완료되었습니다";
      }
   
   
   //여행정보공유(후기) 작성페이지에서 저장버튼 클릭시
   @RequestMapping(value = "afterBoardInsert.mh")
   public void afterBoardInsert(@RequestBody String content, HttpSession session) {
      System.out.println("화면에서 넘어온 정보 : " + content);
      JSONParser jp = new JSONParser();
      
      Date d = new Date();
      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

      try {
         JSONObject jo = (JSONObject) jp.parse(content);
         jo.put("after_id", session.getAttribute("id"));
         jo.put("write_date", format.format(d));
         
         service.afterBoardInsert(jo);
                  
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   @RequestMapping(value="afterDetailed.mh")
   public String afterDetailed(String pageNum, Model model,String id) {
      System.out.println("~~~~~~~~~~~~~~~"+id);
      if(id != null) {
         pageNum = id;
      }
      System.out.println("페이지번호 : " + pageNum);
      
      JSONObject jo = service.afterDetail(pageNum);
      
      System.out.println("글" + jo.toString());
      
      model.addAttribute("afterDetail", jo);
      if(id != null) {
    	  System.out.println("안드로이드 들어갔다");
         return "community/afterAndroidDetailed";
      }else {
         return "community/afterDetailed";
      }
      
      
   }

//   //자유게시판 list 페이지
//   @RequestMapping(value = "freeBoardList.mh")
//   public String freeList(Locale locale, Model model) {
//      
//      System.out.println("자유게시판 리스트 컨트롤러");
//      return "community/freeBoardList";
//   }
//   
//   
//   //자유게시판 작성페이지 
//   @RequestMapping(value = "freeBoard.mh")
//   public String freeBoard(Model model) {
//      
//         
//      System.out.println("자유게시판 컨트롤러");
//      return "community/freeBoard";
//   
//}
//   //자유게시판 작성완료시 Repository 이동
//   @RequestMapping(value = "insertFree.mh")
//   public String insertFree(FreeBoard freeBoard, Model model) {
//      
//      
//      
//      
//      System.out.println("자유게시판 작성 저장버튼 컨트롤러" + freeBoard.getbTitle() + freeBoard.getbContent());
//      return "community/freeBoardList";
//}
//   
//   
   
   
//   //메이크맵TESTE
//   @RequestMapping(value = "mapMakeTab.mh")
//   public String mapTab(Locale locale, Model model) {
//      
//      System.out.println("mapMakeTabController");
//      return "community/mapMakeTab";
//   }
   
   
   
//   //메인 시작
//   @RequestMapping(value = "community.mh")
//   public String home(Locale locale, Model model) {
//      
//      System.out.println("comuControl");
//      return "community/community";
//   }
//   

   
}