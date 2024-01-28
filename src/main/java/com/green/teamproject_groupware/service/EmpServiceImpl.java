package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.EmpDao;
import com.green.teamproject_groupware.dto.EmpDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<EmpDto> getEmp() {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		ArrayList<EmpDto> list = dao.getEmp();
		log.info("@# list ==> "+list);
		
		
		return list;
	}
	
	
	@Override
	public EmpDto getEmpByEmpno(String empno) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		EmpDto dto = dao.getEmpByEmpno(empno);
		return dto;
	}
	
	@Override
	public int changeProfile(HashMap<String, String> param) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		return dao.changeProfile(param);
		
	}
	
	@Override
	public EmpDto getEmpByName(String name) {
		EmpDao dao = sqlSession.getMapper(EmpDao.class);
		EmpDto dto = dao.getEmpByName(name);
		return dto;
	}
}
