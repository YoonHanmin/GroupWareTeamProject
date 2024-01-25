package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.UserInfoDto;


@Transactional
public interface MemService {

	public int loginYn(HashMap<String, String> param);
	public EmpDto getUserByEmpno(int empno);
	public void write(HashMap<String, String> param);
	public int checkEmpno(String empno);
	public int checkEmail(HashMap<String, String> param);
	void signUp(UserInfoDto userInfo);
}
