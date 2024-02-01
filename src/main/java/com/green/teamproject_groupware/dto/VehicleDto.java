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
	private int vempno;
	private Date vstartdate;
    private Date venddate;
	private String vdescription;
	private Timestamp vdate;
}
