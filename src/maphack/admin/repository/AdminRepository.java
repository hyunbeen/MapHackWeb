package maphack.admin.repository;

import java.util.List;

import maphack.admin.dto.AdminBoard;
import maphack.admin.dto.FreeBoard;
import maphack.admin.dto.InfoDetail;
import maphack.admin.dto.Member;

public class AdminRepository {
	//회원조회
	public List<Member> listMember(){
		List<Member> list = null;
		return list;
	}
	//회원탈퇴
	public void listMember(Member member){
		List<Member> list = null;
	}
	//정보제공추가
	public void InfoDetailInsert(Member member,InfoDetail info){
			
	}
	
	//정보제공수정
	public void InfoDetailModify(Member member,InfoDetail info){
				
	}
		
	//정보제공삭제
	public void InfoDetailDelete(Member member,InfoDetail info){
						
	}
	
	//자유게시판 삭제
	public void FreeBoardDelete(FreeBoard board) {
		
	}
	//공지사항 삭제
	public void AdminBoardDelete(AdminBoard board) {
			
	}
	
	
}
