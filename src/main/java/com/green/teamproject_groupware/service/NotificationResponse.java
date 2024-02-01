package com.green.teamproject_groupware.service;

import com.green.teamproject_groupware.dto.MsgDto;
import com.green.teamproject_groupware.dto.Notification;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class NotificationResponse {
	private String receiver;
    private String notificationType;
    private String msgTitle;
    private boolean isRead;

    public static NotificationResponse from(Notification notification) {
        return NotificationResponse.builder()
                .receiver(notification.getReceiver())
                .notificationType(notification.getNotificationType())
                .msgTitle(notification.getMsgTitle())
                .isRead(notification.getIsRead())
                .build();
    }
}
