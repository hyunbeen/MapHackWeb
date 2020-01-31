package maphack.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.login.dto.Member;
import maphack.login.repository.LoginRepository;


@Service
public class LoginService {

	@Autowired
	private LoginRepository repo;
		
	//로그인 확인
	public int loginConfirm(Member member) {
		int confirm = repo.loginConfirm(member);
		return confirm;
	}
	

	

	   
}
