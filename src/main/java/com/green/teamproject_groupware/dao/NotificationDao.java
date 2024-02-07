package com.green.teamproject_groupware.dao;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.NotificationDto;

public interface NotificationDao {
	public ArrayList<NotificationDto>getNotification(String empno);
	public int deleteNotification(int msgid);
	public void addNotification(NotificationDto notifyDto);
	public void deleteAllNotification();
	public void read(String notify_id);
}
