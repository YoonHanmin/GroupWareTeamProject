package com.green.teamproject_groupware.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.NotificationDao;
import com.green.teamproject_groupware.dto.NotificationDto;

@Service
public class NotifyService {
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<NotificationDto>getNotification(String empno){
		NotificationDao dao = sqlSession.getMapper(NotificationDao.class);
		ArrayList<NotificationDto> NotifyList = dao.getNotification(empno);
		return NotifyList;
		
	}
	public int deleteNotification(int msgid) {
		NotificationDao dao = sqlSession.getMapper(NotificationDao.class);
		return dao.deleteNotification(msgid);
	}
	public void addNotification(NotificationDto notifyDto) {
		NotificationDao dao = sqlSession.getMapper(NotificationDao.class);
		dao.addNotification(notifyDto);
	}
}
