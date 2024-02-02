package com.green.teamproject_groupware.service;


import java.util.ArrayList;
import java.util.List;

import com.green.teamproject_groupware.dto.VacationRequestDto;

public interface VacationService {
	void vacationRequest(VacationRequestDto vacationDTO);
	public ArrayList<VacationRequestDto> myVacationRequests(String empno);
	public void cancelVacation(int empid);
	public List<VacationRequestDto> getEventsForCalendar(String empno);
	public ArrayList<VacationRequestDto> vacationApproval(String empno);
}
