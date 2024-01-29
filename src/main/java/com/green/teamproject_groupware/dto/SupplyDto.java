package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SupplyDto {
	private int supply_id;
	private String sempno;
	private String sname;
	private String item;
	private int quantity;
	private String sdescription;
	private Timestamp sdate;
}
