package com.green.teamproject_groupware.service;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.teamproject_groupware.dao.VacationDao;
import com.green.teamproject_groupware.dto.VacationRequestDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("VacationService")
@Transactional
public class VacationServiceImpl implements VacationService {
	
    @Autowired
    private SqlSession sqlSession;

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
	public ArrayList<VacationRequestDto> vacationApproval(String empno) {
    	VacationDao dao = sqlSession.getMapper(VacationDao.class);
        ArrayList<VacationRequestDto> list2= dao.myVacationRequests(empno);
		return list2;
	}
}
