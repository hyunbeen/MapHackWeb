package maphack.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import maphack.mypage.dto.Favorite;
import maphack.mypage.dto.TravelMap;
import maphack.mypage.repository.MyPageRepository;

@Service
public class MyPageService {
   @Autowired
   private MyPageRepository repository;
   
   public List<Favorite> favoriteList(String bmMid){
		 
	     
	      List<Favorite> favoriteList = repository.favoriteList(bmMid);
	      
	     
	     
	      return favoriteList;
	 }
   
   public List<TravelMap> travelList(String m_id) {
	   
	   List<TravelMap> travelList = repository.travelList(m_id);
	   return travelList;
	   
   }
   
}