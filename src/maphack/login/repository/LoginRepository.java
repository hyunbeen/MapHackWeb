package maphack.login.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import maphack.login.dto.Member;
//로그인 서비스
@Repository
public class LoginRepository {
	@Autowired
	   private SqlSessionTemplate ss;
	
	public int loginConfirm(Member member){

	      int loginConfirm = ss.selectOne("login.loginConfirm", member);
	      return loginConfirm;
	   }

}
