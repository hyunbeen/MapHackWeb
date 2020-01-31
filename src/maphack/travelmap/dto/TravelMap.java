package maphack.travelmap.dto;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.web.multipart.MultipartFile;

public class TravelMap {
	@Id
   private String map_mapnum;
   private String map_title;
	private List<DayMark> map_day_list;
	private String map_id;
	private String map_fname;

	private String map_start_date;
	private long map_fsize;

  //Mark
   
   
   
   MultipartFile file;   // write.jsp에 파일첨부시 name="file"과 동일한 변수명
   
   
   
   
   
   public MultipartFile getFile() {
      return file;
   }
   public void setFile(MultipartFile file) {
      this.file = file;
      
      // 업로드 파일 접근
            if(! file.isEmpty()){
               this.map_fname = file.getOriginalFilename();
               
               File f = new File("C:\\Users\\KOSTA\\git\\TravelMap\\MapHack\\WebContent\\upload\\"+map_fname );
               
               
               try {
                  file.transferTo(f);
                  
               } catch (IllegalStateException e) {            
                  e.printStackTrace();
               } catch (IOException e) {
                  
                  e.printStackTrace();
               }
            }
   }
public String getMap_mapnum() {
	return map_mapnum;
}
public void setMap_mapnum(String map_mapnum) {
	this.map_mapnum = map_mapnum;
}
public String getMap_title() {
	return map_title;
}
public void setMap_title(String map_title) {
	this.map_title = map_title;
}

public List<DayMark> getMap_day_list() {
	return map_day_list;
}
public void setMap_day_list(List<DayMark> map_day_list) {
	this.map_day_list = map_day_list;
}




public String getMap_id() {
	return map_id;
}

public void setMap_id(String map_id) {
	this.map_id = map_id;
}
public String getMap_fname() {
	return map_fname;
}
public void setMap_fname(String map_fname) {
	this.map_fname = map_fname;
}
public long getMap_fsize() {
	return map_fsize;
}
public void setMap_fsize(long map_fsize) {
	this.map_fsize = map_fsize;
}
public String getMap_start_date() {
	return map_start_date;
}
public void setMap_start_date(String map_start_date) {
	this.map_start_date = map_start_date;
}   
   
   
  


   
}