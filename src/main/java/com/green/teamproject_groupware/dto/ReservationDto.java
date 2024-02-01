package com.green.teamproject_groupware.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDto {

	private int reservation_id;
	private int rempno;
	private int numOfPeople;
	private Date checkInDate;
	private Date checkOutDate;
	private String details;
	private Timestamp rdate;
}

