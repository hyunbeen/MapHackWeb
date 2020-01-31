package maphack.community.dto;

import java.util.ArrayList;

public class AfterBoardVO {
	
	private ArrayList<MapVO> mapList;
	private ArrayList<ImageVO> imageList;
	private ArrayList<TextVO> textList;
	private String title;
	
	public ArrayList<MapVO> getMapList() {
		return mapList;
	}
	public void setMapList(ArrayList<MapVO> mapList) {
		this.mapList = mapList;
	}
	public ArrayList<ImageVO> getImageList() {
		return imageList;
	}
	public void setImageList(ArrayList<ImageVO> imageList) {
		this.imageList = imageList;
	}
	public ArrayList<TextVO> getTextList() {
		return textList;
	}
	public void setTextList(ArrayList<TextVO> textList) {
		this.textList = textList;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	

}
