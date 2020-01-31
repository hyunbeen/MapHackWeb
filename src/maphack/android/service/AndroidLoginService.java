package maphack.android.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.android.dto.Member;
import maphack.android.repository.AndroidLoginRepository;


@Service
public class AndroidLoginService {

	@Autowired
	private AndroidLoginRepository repo;
		
	//리뷰 조회
	public int loginConfirm(Member member) {
		int confirm = repo.loginConfirm(member);
		return confirm;
	}
	

	   
}
