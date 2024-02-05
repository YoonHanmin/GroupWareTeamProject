package com.green.teamproject_groupware.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VehicleDto {
	private int vehicle_id;
	private int empno;
	private Date vstartdate;
    private Date venddate;
	private String vdescription;
	private Timestamp vdate;
	private int vehicle_status;
	private String delYn;
	private Timestamp modifyDtm;
}
