package com.green.teamproject_groupware.service;


import java.util.ArrayList;

import com.green.teamproject_groupware.dto.VacationRequestDto;

public interface VacationService {
	void vacationRequest(VacationRequestDto vacationDTO);
	public ArrayList<VacationRequestDto> myVacationRequests(String empno);
	boolean checkDuplicateVacation(String empno, String startdate, String enddate);
}
