package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.VehicleDao;
import com.green.teamproject_groupware.dto.VehicleDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("VehicleService")
public class VehicleServiceImpl implements VehicleService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<VehicleDto> vehicle_list(String empno) {
		log.info("@# VehicleServiceImpl.vehicle_list() start");
		VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		
		ArrayList<VehicleDto> vehicleList = dao.vehicle_list(empno);
		
		return vehicleList;
	}

	@Override
	public void vehicle_write(VehicleDto formData2) {
		log.info("@# VehicleServiceImpl.vehicle_write() start");
		
		 try {
			 VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		        dao.vehicle_write(formData2);
		        log.info("@# Write Success!");
		    } catch (Exception e) {
		        log.error("@# Write Failed: " + e.getMessage());
		        e.printStackTrace();
		        throw new RuntimeException("vehicle_write Failed", e);
		    }

		
		log.info("@# VehicleServiceImpl.vehicle_write() end");		
	}

	@Override
	public VehicleDto vehicle_contentView(HashMap<String, String> param) {
		log.info("@# VehicleServiceImpl.vehicle_contentView() start");
		
		VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		VehicleDto dto = dao.vehicle_contentView(param);
		
		log.info("@# VehicleServiceImpl.vehicle_contentView() end");
		return dto;
	}

	@Override
	public void vehicle_modify(HashMap<String, String> param) {
		log.info("@# VehicleServiceImpl.modify() start");
		
		VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		dao.vehicle_modify(param);
		log.info("@# VehicleServiceImpl.modify() end");
	}

	@Override
	public void vehicle_delete(String vehicle_id) {
		log.info("@# VehicleServiceImpl.delete() start");
		
		VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		dao.vehicle_delete(vehicle_id);
}

	@Override
	public void vehicleApprovalUpdate(String vehicle_id) {
		log.info("@# VehicleServiceImpl.vehicleApprovalUpdate() start");
		
		VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		dao.vehicleApprovalUpdate(vehicle_id);
}

	@Override
	public void vehicleRejectUpdate(String vehicle_id) {
		log.info("@# VehicleServiceImpl.vehicleRejectUpdate() start");
		
		VehicleDao dao = sqlSession.getMapper(VehicleDao.class);
		dao.vehicleRejectUpdate(vehicle_id);
}

}
