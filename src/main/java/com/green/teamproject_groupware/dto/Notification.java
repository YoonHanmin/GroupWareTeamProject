package com.green.teamproject_groupware.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Notification {
	
	 	private String receiver; //알림을 받는 유저의 정보   
	    private String notificationType; //알림 종류별 분류
	    private String msgTitle; //알람의 제목
	    private String url;
	    private Boolean isRead; //알림 열람에 대한 여부
}
