package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.teamproject_groupware.dao.FBDao;
import com.green.teamproject_groupware.dto.FBDto;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service("FBService")
public class FBServiceImpl implements FBService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<FBDto> free_board_list() {
		log.info("@# FBServiceImpl.list() start");
		
		FBDao dao = sqlSession.getMapper(FBDao.class);
		ArrayList<FBDto> free_board_list = dao.free_board_list();
		
		log.info("@# FBServiceImpl.list() end");
		return free_board_list;
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# FBServiceImpl.write() start");
		
		FBDao dao = sqlSession.getMapper(FBDao.class);
		dao.write(param);
		
		log.info("@# FBServiceImpl.write() end");		
	}

	@Override
	public FBDto contentView(HashMap<String, String> param) {
		log.info("@# FBServiceImpl.contentView() start");
		
		FBDao dao = sqlSession.getMapper(FBDao.class);
		FBDto dto = dao.contentView(param);
		
		log.info("@# FBServiceImpl.contentView() end");
		return dto;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		log.info("@# FBServiceImpl.modify() start");
		
		FBDao dao = sqlSession.getMapper(FBDao.class);
		dao.modify(param);
		
		log.info("@# FBServiceImpl.modify() end");
		
	}

	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# FBServiceImpl.delete() start");
		
		FBDao dao = sqlSession.getMapper(FBDao.class);
		dao.delete(param);
		
		
		log.info("@# FBServiceImpl.delete() end");
	}

	@Override
	public void increaseHit(HashMap<String, String> param) {
		FBDao dao = sqlSession.getMapper(FBDao.class);
		 dao.increaseHit(param);
		
	}

}
