package maphack.join.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import maphack.join.dto.Member;

//로그인 서비스
@Repository
public class JoinRepository {
	@Autowired
	   private SqlSessionTemplate ss;
	
	
	public int makeMember(Member member){

	      int loginConfirm = ss.insert("join.makeMember", member);
	      return loginConfirm;
	   }
}
