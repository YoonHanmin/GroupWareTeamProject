package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.green.teamproject_groupware.dto.EmpDto;

public interface EmpDao {
	public ArrayList<EmpDto> getEmp();
	public EmpDto getEmpByEmpno(String empno);
	public int changeProfile(HashMap<String, String> param);
	public EmpDto getEmpByName(String name);
	
	
	
//	public List<EmpDto> searchEmployees(String condition, String keyword); // 새로운 메소드 추가
}
