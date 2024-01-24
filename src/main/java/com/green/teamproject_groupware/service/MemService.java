package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.green.teamproject_groupware.dto.UserInfoDto;



public interface MemService {

	public ArrayList<UserInfoDto> loginYn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
	// EMP테이블 조회 메소드
	public HashMap<String, String> getEmployeeInfo(int empNo);
	
	//회원가입 처리 메소드
	public void signup(HashMap<String, String> param);
}
