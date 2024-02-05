package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.ReservationDto;

public interface ReservationService {
	public ArrayList<ReservationDto> reservation_list(String empno);
	public void reservation_write(ReservationDto formData4);
	public ReservationDto reservation_contentView(HashMap<String, String> param);
	public void reservation_modify(HashMap<String, String> param);
	public void reservation_delete(String reservation_id);
	public void reservationRejectUpdate(String reservation_id);
	public void reservationApprovalUpdate(String reservation_id);
}
