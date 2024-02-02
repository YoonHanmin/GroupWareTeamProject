package com.green.teamproject_groupware.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.teamproject_groupware.dto.VacationRequestDto;

public interface VacationService {
	public void vacationRequest(VacationRequestDto vacationDTO);
	public ArrayList<VacationRequestDto> myVacationRequests(String empno);
	public void cancelVacation(int empid);
	public ArrayList<VacationRequestDto> vacationApproval(String empno);
	public ArrayList<VacationRequestDto> getVacationEvents(String empno);
}
