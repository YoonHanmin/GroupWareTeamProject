package com.green.teamproject_groupware.service;

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
    private String msgFromName;
    private String url;
    private boolean isRead;

    public static NotificationResponse from(Notification notification) {
    	
      
			return 
					NotificationResponse.builder()
			        .receiver(notification.getReceiver())
			        .notificationType(notification.getNotificationType())
			        .msgFromName(notification.getMsgFromName())
			        .url(notification.getUrl())
			        .isRead(notification.getIsRead())
			        .build();
		
    }
}
