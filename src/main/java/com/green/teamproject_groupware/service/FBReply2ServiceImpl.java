package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.FBReply2Dao;
import com.green.teamproject_groupware.dto.FBReply2DTO;

@Service
public class FBReply2ServiceImpl implements FBReply2Service{
    @Autowired
    private SqlSession sqlSession;

	@Override
	public ArrayList<FBReply2DTO> rrlist(int bid, int parentrid) {
		FBReply2Dao dao = sqlSession.getMapper(FBReply2Dao.class);
		ArrayList<FBReply2DTO> rrlist = dao.rrlist(bid, parentrid);
		return rrlist;
	}

	@Override
	public void rrwrite(FBReply2DTO dto) {
		FBReply2Dao dao = sqlSession.getMapper(FBReply2Dao.class);
		dao.rrwrite(dto);
	}

	@Override
	public void rrmodify(FBReply2DTO dto) {
		FBReply2Dao dao = sqlSession.getMapper(FBReply2Dao.class);
		dao.rrmodify(dto);
	}

	@Override
	public void rrdelete(FBReply2DTO dto) {
		FBReply2Dao dao = sqlSession.getMapper(FBReply2Dao.class);
		dao.rrdelete(dto);
	}
}