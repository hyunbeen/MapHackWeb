package maphack.infodetail.common;

public class InfoVO {

	private String info = "";
	private String numOfRows = ""; //: 한 페이지 결과 수
	private String pageNo = ""; //: 페이지 번호  
	private String MobileOS = "ETC"; //: OS 구분
	private String MobileApp = "TourAPI3.0_Guide"; //: 서비스명
	private String ServiceKey = ""; //: 인증키(서비스키)
	private String areaCode = ""; //: 지역코드
	private String contentTypeId = ""; //: 관광타입ID
	private String cat1 = ""; //: 대분류
	private String cat2 = ""; //: 중분류
	private String cat3 = ""; //: 소분류
	private String listYN = ""; //: 목록 구분
	private String arrange = ""; //: 정렬 구분
	private String sigunguCode = ""; //: 시군구코드
	private String mapX = ""; //: X좌표
	private String mapY = ""; //: Y좌표
	private String radius = ""; //: 거리 반경
	private String keyword = ""; //: 요청 키워드
	private String eventStartDate = ""; //: 행사 시작일
	private String eventEndDate = ""; //: 행사 종료일
	private String hanOk = ""; //: 한옥 여부
	private String benikia = ""; //: 베니키아 여부
	private String goodStay = ""; //: 굿스테이 여부
	private String contentId = ""; //: 콘텐츠 ID
	private String defaultYN = ""; //: 기본 정보 조회
	private String firstImageYN = ""; //: 대표이미지 조회
	private String areacodeYN = ""; //: 지역코드 조회
	private String catcodeYN = ""; //: 서비스 분류코드 조회
	private String addrinfoYN = ""; //: 주소 조회
	private String mapinfoYN = ""; //: 좌표 조회
	private String overviewYN = ""; //: 개요 조회
	private String introYN = ""; //: 소개정보 조회
	private String detailYN = ""; //: 반복정보 조회
	private String imageYN = ""; //: 이미지 조회1
	private String subImageYN = ""; //: 이미지 조회2
	
	private int start;
	private int end;
	
	
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getMobileOS() {
		return MobileOS;
	}
	public void setMobileOS(String mobileOS) {
		MobileOS = mobileOS;
	}
	public String getMobileApp() {
		return MobileApp;
	}
	public void setMobileApp(String mobileApp) {
		MobileApp = mobileApp;
	}
	public String getServiceKey() {
		return ServiceKey;
	}
	public void setServiceKey(String serviceKey) {
		ServiceKey = serviceKey;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getContentTypeId() {
		return contentTypeId;
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getListYN() {
		return listYN;
	}
	public void setListYN(String listYN) {
		this.listYN = listYN;
	}
	public String getArrange() {
		return arrange;
	}
	public void setArrange(String arrange) {
		this.arrange = arrange;
	}
	public String getSigunguCode() {
		return sigunguCode;
	}
	public void setSigunguCode(String sigunguCode) {
		this.sigunguCode = sigunguCode;
	}
	public String getMapX() {
		return mapX;
	}
	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	public String getMapY() {
		return mapY;
	}
	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	public String getRadius() {
		return radius;
	}
	public void setRadius(String radius) {
		this.radius = radius;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public String getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public String getHanOk() {
		return hanOk;
	}
	public void setHanOk(String hanOk) {
		this.hanOk = hanOk;
	}
	public String getBenikia() {
		return benikia;
	}
	public void setBenikia(String benikia) {
		this.benikia = benikia;
	}
	public String getGoodStay() {
		return goodStay;
	}
	public void setGoodStay(String goodStay) {
		this.goodStay = goodStay;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getDefaultYN() {
		return defaultYN;
	}
	public void setDefaultYN(String defaultYN) {
		this.defaultYN = defaultYN;
	}
	public String getFirstImageYN() {
		return firstImageYN;
	}
	public void setFirstImageYN(String firstImageYN) {
		this.firstImageYN = firstImageYN;
	}
	public String getAreacodeYN() {
		return areacodeYN;
	}
	public void setAreacodeYN(String areacodeYN) {
		this.areacodeYN = areacodeYN;
	}
	public String getCatcodeYN() {
		return catcodeYN;
	}
	public void setCatcodeYN(String catcodeYN) {
		this.catcodeYN = catcodeYN;
	}
	public String getAddrinfoYN() {
		return addrinfoYN;
	}
	public void setAddrinfoYN(String addrinfoYN) {
		this.addrinfoYN = addrinfoYN;
	}
	public String getMapinfoYN() {
		return mapinfoYN;
	}
	public void setMapinfoYN(String mapinfoYN) {
		this.mapinfoYN = mapinfoYN;
	}
	public String getOverviewYN() {
		return overviewYN;
	}
	public void setOverviewYN(String overviewYN) {
		this.overviewYN = overviewYN;
	}
	public String getIntroYN() {
		return introYN;
	}
	public void setIntroYN(String introYN) {
		this.introYN = introYN;
	}
	public String getDetailYN() {
		return detailYN;
	}
	public void setDetailYN(String detailYN) {
		this.detailYN = detailYN;
	}
	public String getImageYN() {
		return imageYN;
	}
	public void setImageYN(String imageYN) {
		this.imageYN = imageYN;
	}
	public String getSubImageYN() {
		return subImageYN;
	}
	public void setSubImageYN(String subImageYN) {
		this.subImageYN = subImageYN;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
	
	
	
	
	


	
}
