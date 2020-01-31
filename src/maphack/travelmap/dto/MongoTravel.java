package maphack.travelmap.dto;

import org.springframework.data.annotation.Id;

public class MongoTravel {
	   @Id
	   private String map_num;
	   private String map_title;
	   private MapGroup map_group[];
	   private String map_img;
	   private MapContent map_content[];
	   private String map_start_date;
	   private String map_mid;
	   private String map_fname;
	public String getMap_num() {
		return map_num;
	}
	public void setMap_num(String map_num) {
		this.map_num = map_num;
	}
	public String getMap_title() {
		return map_title;
	}
	public void setMap_title(String map_title) {
		this.map_title = map_title;
	}
	public MapGroup[] getMap_group() {
		return map_group;
	}
	public void setMap_group(MapGroup[] map_group) {
		this.map_group = map_group;
	}
	public String getMap_img() {
		return map_img;
	}
	public void setMap_img(String map_img) {
		this.map_img = map_img;
	}
	public MapContent[] getMap_content() {
		return map_content;
	}
	public void setMap_content(MapContent[] map_content) {
		this.map_content = map_content;
	}
	public String getMap_start_date() {
		return map_start_date;
	}
	public void setMap_start_date(String map_start_date) {
		this.map_start_date = map_start_date;
	}
	public String getMap_mid() {
		return map_mid;
	}
	public void setMap_mid(String map_mid) {
		this.map_mid = map_mid;
	}
	public String getMap_fname() {
		return map_fname;
	}
	public void setMap_fname(String map_fname) {
		this.map_fname = map_fname;
	}
}
