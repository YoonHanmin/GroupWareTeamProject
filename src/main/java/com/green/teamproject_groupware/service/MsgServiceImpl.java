package com.green.teamproject_groupware.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.MsgDao;
import com.green.teamproject_groupware.dto.MsgDto;

@Service
public class MsgServiceImpl implements MsgService {

	@Autowired
	private SqlSession sqlSession;
	
	
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
		return dao.sendMsg(dto);
		
	}
	
}
