package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.teamproject_groupware.dto.VacationRequestDto;


public interface VacationDao {
	public void vacationRequest(VacationRequestDto vacationDTO);
	public ArrayList<VacationRequestDto> myVacationRequests(String empno);
//	boolean checkDuplicateVacation(String empno, String startdate, String enddate);
	 boolean checkDuplicateVacation(@Param("empno") String empno, @Param("startdate") String startdate, @Param("enddate") String enddate);
}
