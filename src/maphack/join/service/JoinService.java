package maphack.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.join.dto.Member;
import maphack.join.repository.JoinRepository;


@Service
public class JoinService {

	@Autowired
	private JoinRepository repo;
		
	
	//회원 가입
		public int makeMember(Member member) {
			int confirm = repo.makeMember(member);
			return confirm;
		}
	

	   
}
