package com.green.teamproject_groupware.dao;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.EmpDto;

public interface EmpDao {
	public ArrayList<EmpDto> getEmp();
	public EmpDto getEmpByEmpno(String empno);
}
