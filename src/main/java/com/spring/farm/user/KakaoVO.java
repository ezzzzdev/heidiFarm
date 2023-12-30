package com.spring.farm.user;

public class KakaoVO {
	
	private String REDIRECT_URI = "http://localhost:8090";
	private String REST_API_KEY = "800e4177fe74c3a081caffac5e719aad";
	private String ADMIN_KEY = "a9374f2ef30ff994391ccf879f149d01";
	private String code;
	
	public String getREDIRECT_URI() {
		return REDIRECT_URI;
	}
	public void setREDIRECT_URI(String rEDIRECT_URI) {
		REDIRECT_URI = rEDIRECT_URI;
	}
	public String getREST_API_KEY() {
		return REST_API_KEY;
	}
	public void setREST_API_KEY(String rEST_API_KEY) {
		REST_API_KEY = rEST_API_KEY;
	}
	public String getADMIN_KEY() {
		return ADMIN_KEY;
	}
	public void setADMIN_KEY(String aDMIN_KEY) {
		ADMIN_KEY = aDMIN_KEY;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "KakaoVO [REDIRECT_URI=" + REDIRECT_URI + ", REST_API_KEY=" + REST_API_KEY + ", ADMIN_KEY=" + ADMIN_KEY
				+ ", code=" + code + "]";
	}
	
	

}
