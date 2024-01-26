package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.SupplyDao;
import com.green.teamproject_groupware.dto.RequestDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SupplyService")
public class SupplyServiceImpl implements SupplyService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<RequestDto> supply_list() {
		log.info("@# SupplyServiceImpl.supply_list() start");
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		
		ArrayList<RequestDto> dto = dao.supply_list();
		
		return dto;
	}

	@Override
	public void write(HashMap<String, String> param) {
		log.info("@# SupplyServiceImpl.write() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		dao.write(param);
		
	}

	@Override
	public RequestDto contentView(HashMap<String, String> param) {
		log.info("@# SupplyServiceImpl.contentView() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		RequestDto dto = dao.contentView(param);
		
		return dto;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		log.info("@# SupplyServiceImpl.modify() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		dao.modify(param);
		
		
	}
	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# SupplyServiceImpl.delete() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		dao.delete(param);
		
	}

}
