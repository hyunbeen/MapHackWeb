package maphack.android.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import maphack.android.dto.Member;
import maphack.android.dto.User;
//로그인 서비스
@Repository
public class AndroidLoginRepository {
	@Autowired
	   private SqlSessionTemplate ss;
	
	public int loginConfirm(Member member){

	      int loginConfirm = ss.selectOne("login.androidLoginConfirm", member);
	      return loginConfirm;
	   }
}
