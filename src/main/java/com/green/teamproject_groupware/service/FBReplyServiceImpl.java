package com.green.teamproject_groupware.service;

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

@Service
public class FBReplyServiceImpl implements FBReplyService{
    @Autowired
    private SqlSession sqlSession;

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
		dao.rwrite(dto);
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
