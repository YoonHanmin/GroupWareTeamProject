package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.green.teamproject_groupware.dto.VacationRequestDto;


public interface VacationDao {
	public void vacationRequest(VacationRequestDto vacationDTO);
	public ArrayList<VacationRequestDto> myVacationRequests(String empno);
	public void cancelVacation(int empid);
	public List<VacationRequestDto> getEventsForCalendar(String empno);
	public ArrayList<VacationRequestDto> vacationApproval(String empno);
}
