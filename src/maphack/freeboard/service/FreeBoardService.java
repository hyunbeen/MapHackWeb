package maphack.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.freeboard.dto.FreeBoard;
import maphack.freeboard.repository.FreeBoardRepository;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardRepository freeBoardRepository;

	
	public int freeBoardInsert(FreeBoard freeBoard) {
		
		int result = freeBoardRepository.freeBoardInsert(freeBoard);
		
		return result;
	}
	
	
	public List<FreeBoard> freeBoardList(FreeBoard freeBoard) {
		
		List<FreeBoard> list = freeBoardRepository.freeBoardList(freeBoard);
		
		return list;
	}
	
		public FreeBoard freeBoardView(FreeBoard freeBoard) {
		
		FreeBoard view = freeBoardRepository.freeBoardView(freeBoard);
		
		return view;
	}
	
	
	
}
