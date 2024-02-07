package com.green.teamproject_groupware.service;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.teamproject_groupware.dao.VacationDao;
import com.green.teamproject_groupware.dto.NotificationDto;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.VacationApprovalDto;
import com.green.teamproject_groupware.dto.VacationRequestDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("VacationService")
@Transactional
public class VacationServiceImpl implements VacationService {
	
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private NotifyService notifyService;
    
    
	@Override
    public void vacationRequest(VacationRequestDto vacationDTO) {
        VacationDao dao = sqlSession.getMapper(VacationDao.class);
        dao.vacationRequest(vacationDTO);
    }

	@Override
	public ArrayList<VacationRequestDto> myVacationRequests(String empno) {
    	VacationDao dao = sqlSession.getMapper(VacationDao.class);
        ArrayList<VacationRequestDto> list= dao.myVacationRequests(empno);
		return list;
	}

	@Override
	public void cancelVacation(int empid) {
        try {
            VacationDao dao = sqlSession.getMapper(VacationDao.class);
            dao.cancelVacation(empid);
        } catch (Exception e) {
            log.error("휴가 취소 중 오류 발생.", e);
            throw new RuntimeException("휴가 취소 중 오류 발생: " + e.getMessage(), e);
        }
	}

    @Override
    public ArrayList<VacationRequestDto> getVacationEvents(String empno) {
        try {
            VacationDao dao = sqlSession.getMapper(VacationDao.class);
            return dao.getVacationEvents(empno);
        } catch (Exception e) {
            log.error("휴가 이벤트 가져오기 중 오류 발생.", e);
            throw new RuntimeException("휴가 이벤트 가져오기 중 오류 발생: " + e.getMessage(), e);
        }
    }

	@Override
	public ArrayList<VacationRequestDto> vacationApproval(String empno) {
		log.info("@# VacationServiceImpl.vacationList() start");
		VacationDao dao = sqlSession.getMapper(VacationDao.class);
		
		ArrayList<VacationRequestDto> vacationList  = dao.vacationApproval(empno);
		return vacationList;
	}
	
    @Override
    public int countRequest() {
    	VacationDao dao = sqlSession.getMapper(VacationDao.class);
        return dao.countRequest();
    }

    @Override
    public int countApproval() {
    	VacationDao dao = sqlSession.getMapper(VacationDao.class);
        return dao.countApproval();
    }

    @Override
    public int countReject() {
    	VacationDao dao = sqlSession.getMapper(VacationDao.class);
        return dao.countReject();
    }

	@Override
	public void vacationApprovalUpdate(int empid) {
		VacationDao dao = sqlSession.getMapper(VacationDao.class);
		dao.vacationApprovalUpdate(empid);
		//알림 추가
		VacationRequestDto dto = dao.getVacationByID(empid);
		NotificationDto notify_dto = new NotificationDto();
		notify_dto.setNotify_type("VACATION");
		notify_dto.setNotify_receiver(dto.getName());
		notify_dto.setNotify_sender(""+dto.getEmpno());
		notify_dto.setNotify_time(new Timestamp(System.currentTimeMillis()));
		notify_dto.setMsg_id(empid);
		notify_dto.setEmpno(""+dto.getEmpno());
		notifyService.addNotification(notify_dto);
		log.info("휴가승인 알림 저장!!==>"+notify_dto);
		
	}
@Override
public VacationRequestDto getVacationByID(int empid) {
	VacationDao dao = sqlSession.getMapper(VacationDao.class);
	VacationRequestDto dto = dao.getVacationByID(empid);
	return dto;
}
	
	
	@Override
	public void vacationRejectUpdate(int empid) {
		VacationDao dao = sqlSession.getMapper(VacationDao.class);
		dao.vacationRejectUpdate(empid);	
	}
	@Override
	public ArrayList<VacationRequestDto> getApproval_Vacation(String empno) {
		VacationDao dao = sqlSession.getMapper(VacationDao.class);
		ArrayList<VacationRequestDto> list = dao.getApproval_Vacation(empno);
		return list;
	}
}
