package com.green.teamproject_groupware.service;

import java.sql.Timestamp;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.teamproject_groupware.dto.MsgDto;
import com.green.teamproject_groupware.dto.Notification;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class NotificationResponse {
	private String receiver;
    private String notificationType;
    private MsgDto msgDto;
    private Timestamp time;
    private String url;
    private boolean isRead;

    public static NotificationResponse from(Notification notification) {
    	
      
			return 
					NotificationResponse.builder()
			        .receiver(notification.getReceiver())
			        .notificationType(notification.getNotificationType())
			        .msgDto(notification.getMsgDto())
			        .url(notification.getUrl())
			        .time(notification.getTime())
			        .isRead(notification.getIsRead())
			        .build();
		
    }
}
