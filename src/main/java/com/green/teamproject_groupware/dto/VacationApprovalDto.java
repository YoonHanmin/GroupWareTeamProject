package com.green.teamproject_groupware.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VacationApprovalDto {
    private int empid;
    private int empno;
    private String name;
    private String position;
    private String vacationtype;
    private String vacationdays;
    private String reason;
    private Date startdate;
    private Date enddate;
    private String status;
    private Timestamp requestdate;
    private Timestamp modifydate;
    private boolean read;
}
