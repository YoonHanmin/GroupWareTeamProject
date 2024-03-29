package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.UserInfoDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("MemberService")
@Transactional
public class MemServiceImpl implements MemService{
	
	//dao 호출
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int loginYn(HashMap<String, String>param) {
		log.info("@# param====>> "+param);
		String mPw = param.get("password");
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		UserInfoDto dtos = dao.loginYn(param);
		
		int result;
		if(dtos ==null) {
			result = 0; //존재하지않는 아이디
		}else if(mPw.equals(dtos.getPassword())) {
			result= 1; // 로그인 성공			 
		}else {
			result = -1; //비밀번호 불일치
		}
		return result;
	}
	
	@Override
	public void write(HashMap<String, String> param) {
		
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		dao.write(param);
		
	}
	
	@Override
	public EmpDto getUserByEmpno(int empno) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		EmpDto user = dao.getUserByEmpno(empno);
		return user;
	}
	
	@Override
	public int checkEmpno(String empno) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		log.info("@# 로그값 ==>"+dao.checkEmpno(empno));
		
		return dao.checkEmpno(empno);
		
	}
	
	@Override
	public int checkEmail(HashMap<String, String> param) {
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		
		return dao.checkEmail(param);
	}
	
	@Override
	public void signUp(UserInfoDto userInfo) {
	    try {
	        if (userInfo == null) {
	            throw new IllegalArgumentException("회원 정보가 유효하지 않습니다.");
	        }

	        IMemDao dao = sqlSession.getMapper(IMemDao.class);
	        dao.signUp(userInfo);
	    } catch (Exception e) {
	        log.error("회원가입 중 에러 발생: " + e.getMessage(), e);
	        throw new RuntimeException("회원가입 중 에러 발생");
	    }
	}
}
