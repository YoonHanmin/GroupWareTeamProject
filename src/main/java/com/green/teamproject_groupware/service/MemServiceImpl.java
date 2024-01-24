package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MemberService")
public class MemServiceImpl implements MemService{
	
	//dao 호출
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<UserInfoDto> loginYn(HashMap<String, String>param) {
		
		String mPw = param.get("mem_pwd");
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		ArrayList<UserInfoDto> dtos = dao.loginYn(param);
		
		return dtos;
	}
	
	@Override
	public void write(HashMap<String, String> param) {
		
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		dao.write(param);
		
	}

	@Override
	public HashMap<String, String> getEmployeeInfo(int empno) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		return dao.getEmployeeInfo(empno);
	}

	@Override
	public void signup(HashMap<String, String> param) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		dao.signup(param);
	}
}
