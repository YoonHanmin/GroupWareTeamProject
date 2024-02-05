package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.ReservationDao;
import com.green.teamproject_groupware.dao.SupplyDao;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.ReservationDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<ReservationDto> reservation_list(String empno) {
		log.info("@# ReservationServiceImpl.reservation_list() start");
		
		ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
		
		ArrayList<ReservationDto> reservationList  = dao.reservation_list(empno);
		
		log.info("@# ReservationServiceImpl.reservation_list() end");
		return reservationList ;
	}

	@Override
	public void reservation_write(ReservationDto formData4) {
		log.info("@# ReservationServiceImpl.reservation_write() start");
		
		 try {
			 ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
			 dao.reservation_write(formData4);
		        log.info("@# reservation_write Success!");
		    } catch (Exception e) {
		        log.error("@# reservation_write Failed: " + e.getMessage());
		        e.printStackTrace();
		        throw new RuntimeException("Write Failed", e);
		    }
		
		log.info("@# ReservationServiceImpl.reservation_write() end");		
	}

	@Override
	public ReservationDto reservation_contentView(HashMap<String, String> param) {
		log.info("@# ReservationServiceImpl.reservation_contentView() start");
		
		 ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
		 ReservationDto dto = dao.reservation_contentView(param);
		
		log.info("@# ReservationServiceImpl.reservation_contentView() end");
		return dto;
	}

	@Override
	public void reservation_modify(HashMap<String, String> param) {
		log.info("@# ReservationServiceImpl.modify() start");
		
		ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
		dao.reservation_modify(param);
		
		log.info("@# ReservationServiceImpl.modify() end");
		
	}

	@Override
	public void reservation_delete(String reservation_id) {
		log.info("@# ReservationServiceImpl.delete() start");
		
		ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
		dao.reservation_delete(reservation_id);
	}

	@Override
	public void reservationApprovalUpdate(String reservation_id) {
		log.info("@# SupplyServiceImpl.supplyApprovalUpdate() start");
		
		ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
		dao.reservationApprovalUpdate(reservation_id);
		
	}

	@Override
	public void reservationRejectUpdate(String reservation_id) {
		log.info("@# SupplyServiceImpl.supplyRejectUpdate() start");
		
		ReservationDao dao = sqlSession.getMapper(ReservationDao.class);
		dao.reservationRejectUpdate(reservation_id);
		
	}


}
