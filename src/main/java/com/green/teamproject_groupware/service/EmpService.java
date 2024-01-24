package com.green.teamproject_groupware.service;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.EmpDto;

public interface EmpService {
	
	public ArrayList<EmpDto> getEmp();
	public EmpDto getEmpByEmpno(String empno);
}
