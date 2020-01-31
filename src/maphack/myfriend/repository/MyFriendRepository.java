package maphack.myfriend.repository;

import java.util.List;

import maphack.myfriend.dto.Friend;
import maphack.myfriend.dto.Member;
import maphack.mytravel.dto.TravelMap;

public class MyFriendRepository {
	//친구목록 가져오기
	public List<Friend> listFriend(Member member){
		List<Friend> list = null;
		return list;
	}
	//친구삭제하기
	public void deleteFriend(Friend friend,Member member){
		
	}
	//멤버리스트 가져오기
	public List<Member> listMember(){
	List<Member> list = null;
	return list;
	} 
	//멤버검색
	public List<Member> searchMember(String cate,String searchText){
	List<Member> list = null;
	return list;
	} 
	//친구요청
	public void InsertMember(Member member){
		
	}
	
	//친구요청중 목록 가져오기
	public List<Friend> listFriendCome(Member member){
		List<Friend> list = null;
		return list;
	}
	//친구 수락하기
	public void FriendComeAgree(Member member,Friend friend){
		
	}
	//친구 거절하기
	public void FriendComeDislike(Member member,Friend friend){
		
	}
	
	//멤버가 요청중인 목록 가져오기
	public List<Friend> listMemberCome(Member member){
		List<Friend> list = null;
		return list;
	}
	
	//멤버가 요청한 목록 취소하기
	public void FriendMemberDislike(Member member,Friend friend){
		
	}
	
	//그룹요청목록 가져오기
		public List<TravelMap> listGroupCome(Member member){
			List<TravelMap> list = null;
			return list;
		}
		
		//그룹요청한 목록 취소하기
		public void GroupMemberDislike(Member member,TravelMap travel){
			
		}
		
		//그룹요청한 목록 수락하기
				public void GroupMemberAgree(Member member,TravelMap travel){
					
				}
	
}
