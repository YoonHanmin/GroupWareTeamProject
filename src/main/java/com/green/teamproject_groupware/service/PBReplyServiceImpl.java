package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.PBReplyDao;
import com.green.teamproject_groupware.dto.PBReplyDTO;

@Service
public class PBReplyServiceImpl implements PBReplyService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<PBReplyDTO> prlist() {
		PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
		
		ArrayList<PBReplyDTO> prlist = dao.prlist();
		
		return prlist;
	}

	@Override
	public void prwrite(HashMap<String, String> param) {
	    PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
	    dao.prwrite(param);
	}

	@Override
	public void prmodify(HashMap<String, String> param) {
		PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
		dao.prmodify(param);
	}

	@Override
	public void prdelete(HashMap<String, String> param) {
		PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
		dao.prdelete(param);
	}
}
