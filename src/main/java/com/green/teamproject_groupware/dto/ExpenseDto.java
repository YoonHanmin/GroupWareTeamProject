package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpenseDto {
	private int expense_id;
    private String empno;
    private String usagePlace;
    private Timestamp edate;
    private int expense_status;
    private String delYn;
    private Timestamp modifyDtm;
}
