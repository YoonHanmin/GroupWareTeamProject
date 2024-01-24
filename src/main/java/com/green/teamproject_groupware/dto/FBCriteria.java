package com.green.teamproject_groupware.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class FBCriteria {
	private int pageNum; //페이지 번호
	private int amount;    //페이지당 글 갯수
	
	private String type;
	private String keyword;
	
	public FBCriteria() {
//		기본 1페이지에 10개씩 걸리게 조건 부여
		this(1,10);  //1~10  2:11~, 3:21~, 4:31~ 이런 식으로
				
	}
	public FBCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}	
	public String[] getTypeArr() {
//		type이 없으면 빈 스트링 객체(기본 목록 조회), 있으면 분리
		return type == null ? new String[] {}:type.split("");
	}
}
