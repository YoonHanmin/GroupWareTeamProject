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
	public boolean checkDuplicateVacation(String empno, String startdate, String enddate) {
	    try {
	        VacationDao dao = sqlSession.getMapper(VacationDao.class);
	        return !dao.checkDuplicateVacation(empno, startdate, enddate);
	    } catch (Exception e) {
	        log.error("중복 체크 중 오류 발생.", e);
	        return false;
	    }
	}
}
