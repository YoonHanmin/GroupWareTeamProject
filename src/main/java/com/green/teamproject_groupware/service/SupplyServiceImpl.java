package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.SupplyDao;
import com.green.teamproject_groupware.dto.SupplyDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("SupplyService")
public class SupplyServiceImpl implements SupplyService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<SupplyDto> supply_list(String empno) {
		log.info("@# SupplyServiceImpl.supply_list() start");
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		
		ArrayList<SupplyDto> supplyList  = dao.supply_list(empno);
		
		return supplyList ;
	}

	@Override
	public SupplyDto supply_contentView(HashMap<String, String> param) {
		log.info("@# SupplyServiceImpl.contentView() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		SupplyDto dto = dao.supply_contentView(param);
		
		return dto;
	}

//	@Override
//	public void supply_modify(HashMap<String, String> param) {
//		log.info("@# SupplyServiceImpl.modify() start");
//		
//		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
//		dao.supply_modify(param);
//		
//		
//	}
//	@Override
//	public void supply_delete(String supply_id) {
//		log.info("@# SupplyServiceImpl.delete() start");
//		
//		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
//		dao.supply_delete(param);
//		
//	}

	@Override
	public void supply_write(SupplyDto formData1) {
		log.info("@# SupplyDto.write() start");
		
		 try {
			 SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		        dao.supply_write(formData1);
		        log.info("@# Write Success!");
		    } catch (Exception e) {
		        log.error("@# Write Failed: " + e.getMessage());
		        e.printStackTrace();
		        throw new RuntimeException("Write Failed", e);
		    }

		
		log.info("@# SupplyDto.write() end");		
	}

	@Override
	public void supply_delete(String supply_id) {
		log.info("@# SupplyServiceImpl.delete() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		dao.supply_delete(supply_id);
	}
	
	@Override
	public void supplyApprovalUpdate(String supply_id) {
		log.info("@# SupplyServiceImpl.supplyApprovalUpdate() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		dao.supplyApprovalUpdate(supply_id);
		
	}

	@Override
	public void supplyRejectUpdate(String supply_id) {
		log.info("@# SupplyServiceImpl.supplyRejectUpdate() start");
		
		SupplyDao dao = sqlSession.getMapper(SupplyDao.class);
		dao.supplyRejectUpdate(supply_id);
		
	}

}
