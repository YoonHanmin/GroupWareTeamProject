package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.UserInfoDto;


public interface IMemDao {
	
	public UserInfoDto loginYn(HashMap<String, String> param);
	public EmpDto getUserByEmpno(int empno);
	public void write(HashMap<String, String> param);
	public int checkEmpno(String empno);
	public void signUp(UserInfoDto userInfo);
}
