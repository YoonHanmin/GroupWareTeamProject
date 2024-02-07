package com.green.teamproject_groupware.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.VacationApprovalDto;
import com.green.teamproject_groupware.dto.VacationRequestDto;

public interface VacationService {
	public void vacationRequest(VacationRequestDto vacationDTO);
	public ArrayList<VacationRequestDto> myVacationRequests(String empno);
	public void cancelVacation(int empid);
	public ArrayList<VacationRequestDto> getVacationEvents(String empno);
	public List<VacationRequestDto> vacationApproval(String empno);
    public int countRequest();
    public int countApproval();
    public int countReject();
	public void vacationApprovalUpdate(int empid);
	public void vacationRejectUpdate(int empid);
	public int getApprovedVacationDays(String empno);
}
