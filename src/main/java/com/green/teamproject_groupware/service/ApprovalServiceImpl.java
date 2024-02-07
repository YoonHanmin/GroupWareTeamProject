package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.ApprovalDao;
import com.green.teamproject_groupware.dto.ApprovalDto;
import com.green.teamproject_groupware.dto.NotificationDto;

@Service
public class ApprovalServiceImpl implements ApprovalService {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	NotifyService notifyService;
	
	@Override
public int docWrite(ApprovalDto dto) {
	ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
	NotificationDto notify_dto = new NotificationDto();
	notify_dto.setNotify_type("APPROVAL");
	notify_dto.setNotify_receiver(""+dto.getFirst_empno());
	notify_dto.setNotify_sender(dto.getDoc_name());
	notify_dto.setNotify_time(dto.getDoc_date());
	notify_dto.setEmpno(""+dto.getFirst_empno());
	notifyService.addNotification(notify_dto);
	
	return dao.docWrite(dto);
}
	@Override
	public ArrayList<ApprovalDto> getAllDoc(String empno) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		ArrayList<ApprovalDto> list = dao.getAllDoc(empno);
		return list;
	}
	
	@Override
	public ArrayList<ApprovalDto> getTodoDoc(String empno) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		ArrayList<ApprovalDto> todoList = dao.getTodoDoc(empno);
		return todoList;
	}
	@Override
	public ApprovalDto getDocById(String doc_id) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		ApprovalDto docDto = dao.getDocById(doc_id);
		return docDto;
	}
	@Override
	public ArrayList<ApprovalDto> getMyDoc(String empno) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		ArrayList<ApprovalDto> ingList = dao.getMyDoc(empno);
		return ingList;
	}
	@Override
	public ArrayList<ApprovalDto> getMyDoc_reject(String empno) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		ArrayList<ApprovalDto> rejectList = dao.getMyDoc_reject(empno);
		return rejectList;
	}
	@Override
	public int doc_approval(HashMap<String, String> param) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		
	
		
		return dao.doc_approval(param);
		
	}
	
	@Override
	public int doc_reject(HashMap<String, String> param) {
		ApprovalDao dao = sqlSession.getMapper(ApprovalDao.class);
		return dao.doc_reject(param);
	}
	
}
