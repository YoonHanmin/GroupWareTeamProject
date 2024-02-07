package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.EmpDto;

public interface EmpService {
	
	public ArrayList<EmpDto> getEmp();
	public EmpDto getEmpByEmpno(String empno);
	public int changeProfile(HashMap<String, String> param);
	public EmpDto getEmpByName(String name);
	
	 
    // 새로운 메서드 추가: 직원 번호로 검색
    ArrayList<EmpDto> searchEmpByEmpno(String empno);
    
    public ArrayList<EmpDto> getSearchEmp(String employeeSearch, String searchType);
}