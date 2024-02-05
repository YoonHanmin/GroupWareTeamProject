package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.MsgDao;
import com.green.teamproject_groupware.dao.NotificationDao;
import com.green.teamproject_groupware.dto.MsgDto;
import com.green.teamproject_groupware.dto.NotificationDto;

@Service
public class MsgServiceImpl implements MsgService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private NotificationService notificationService;
	
	@Override
	public ArrayList<MsgDto> getReceiveMsg(String empno) {
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		ArrayList<MsgDto> list = dao.getReceiveMsg(empno);
		return list;
	}
	
	
	@Override
	public ArrayList<MsgDto> getSendMsg(String empno) {
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		ArrayList<MsgDto> list = dao.getSendMsg(empno);
		return list;
	}
	
	@Override
	public int sendMsg(MsgDto dto) {
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
//		메세지 작성시 해당 메세지의 수신자에게 send 알림 전송
		
		notificationService.sendEvent(String.valueOf(dto.getTo_id()), "NewMsg", dto);
		return dao.sendMsg(dto);
		
	}
	
	@Override
	public ArrayList<MsgDto> getMsgByEmpno(HashMap<String, String> param) {
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		ArrayList<MsgDto> list = dao.getMsgByEmpno(param);
		return list;
	}
	
	@Override
	public int uphit(int msgid) {
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		NotificationDao notifyDao = sqlSession.getMapper(NotificationDao.class);
		notifyDao.deleteNotification(msgid);
		return dao.uphit(msgid);
	}
	@Override
	public ArrayList<MsgDto> getNotifyMsgByEmpno(String empno) {
		MsgDao dao = sqlSession.getMapper(MsgDao.class);
		ArrayList<MsgDto> NotifyList = dao.getNotifyMsgByEmpno(empno);
		return NotifyList;
	}
}
