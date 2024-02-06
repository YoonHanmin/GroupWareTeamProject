package com.green.teamproject_groupware.dto;


public class SearchDto {
	
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
//		type이 없으면 빈 스트링 객체(기본 목록 조회), 있으면 분리
		return type == null ? new String[] {}:type.split("");
	}
}
