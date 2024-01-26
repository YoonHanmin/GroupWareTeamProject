package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RequestDto {
	private int request_id;
	private int sempno;
	private int quantity;
	private String category;
	private String decription;
	private Timestamp sdate;
	private String status;

}
