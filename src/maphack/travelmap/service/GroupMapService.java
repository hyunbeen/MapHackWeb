package maphack.travelmap.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.travelmap.dto.MapGroup;
import maphack.travelmap.dto.Member;
import maphack.travelmap.repository.GroupMapRepository;

@Service
public class GroupMapService {
   @Autowired
   private GroupMapRepository repository;
   //멤버 리스트 가져오기
   public List<Member> listMember(){
	  
      List<Member> list = repository.listMember();
      return list;
   }
   //그룹멤버 가져오기
   public MapGroup[] groupMember(){
		  
	   MapGroup[] list = repository.groupMember();
	   return list;
   }
   
  
   
}