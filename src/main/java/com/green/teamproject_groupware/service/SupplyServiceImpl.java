package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dao.NoticeDao;
import com.green.teamproject_groupware.dao.SupplyDao;
import com.green.teamproject_groupware.dto.SupplyDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SupplyService")
public class SupplyServiceImpl implements SupplyService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<SupplyDto> supply_list() {
		log.info("@# SupplyServiceImpl.supply_list() start");
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		
		ArrayList<SupplyDto> supplyList  = dao.supply_list();
		
		return supplyList ;
	}

	@Override
	public SupplyDto contentView(HashMap<String, String> param) {
		log.info("@# SupplyServiceImpl.contentView() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		SupplyDto dto = dao.contentView(param);
		
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

	@Override
	public void write(SupplyDto formData) {
		log.info("@# SupplyDto.write() start");
		
		 try {
			 SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		        dao.write(formData);
		        log.info("@# Write Success!");
		    } catch (Exception e) {
		        log.error("@# Write Failed: " + e.getMessage());
		        e.printStackTrace();
		        throw new RuntimeException("Write Failed", e);
		    }

		
		log.info("@# SupplyDto.write() end");		
	}	
}
