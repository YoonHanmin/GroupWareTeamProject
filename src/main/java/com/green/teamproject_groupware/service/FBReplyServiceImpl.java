package com.green.teamproject_groupware.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.FBReplyDao;
import com.green.teamproject_groupware.dto.FBReply2DTO;
import com.green.teamproject_groupware.dto.FBReplyDTO;
import com.green.teamproject_groupware.dto.NotificationDto;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class FBReplyServiceImpl implements FBReplyService{
    @Autowired
    private SqlSession sqlSession;
    
    @Autowired
    private NotifyService notifyService;

	@Override
	public ArrayList<FBReplyDTO> rlist(int bid) {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		ArrayList<FBReplyDTO> rlist = dao.rlist(bid);
		
		for (FBReplyDTO reply : rlist) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("bid", bid);
			params.put("parentrid", reply.getRid());
			List<FBReply2DTO> rrlist = rrlist(params);
			reply.setRrlist(rrlist);
		}
		
		return rlist;
	}

	@Override
	public void rwrite(FBReplyDTO dto) {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		int bid = dto.getBid();
		dao.rwrite(dto);
		int rid = getNextRid();
		HashMap<String, String>param = new HashMap<>();
		param.put("bid", String.valueOf(bid));
		param.put("rid",String.valueOf(rid));
		String receiver = dao.getEmpnoByBid(param);
		log.info("receiver ====>>"+receiver);
		NotificationDto notify_dto = new NotificationDto();
		notify_dto.setNotify_type("REPLY");
		notify_dto.setNotify_receiver(receiver);
		notify_dto.setNotify_sender(dto.getRwriter());
		notify_dto.setNotify_time(new Timestamp(System.currentTimeMillis()));
		notify_dto.setEmpno(receiver);
		notifyService.addNotification(notify_dto);
	}
	@Override
	public int getNextRid() {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		return dao.getNextRid();
	}
	@Override
	public String getEmpnoByBid(HashMap<String, String>param) {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		
		return dao.getEmpnoByBid(param);
	}
	
	@Override
	public void rmodify(FBReplyDTO dto) {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		dao.rmodify(dto);
	}

	@Override
	public void rdelete(FBReplyDTO dto) {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		dao.rdelete(dto);
	}

	@Override
	public List<FBReply2DTO> rrlist(Map<String, Object> params) {
		FBReplyDao dao = sqlSession.getMapper(FBReplyDao.class);
		return dao.rrlist(params);
	}
}
