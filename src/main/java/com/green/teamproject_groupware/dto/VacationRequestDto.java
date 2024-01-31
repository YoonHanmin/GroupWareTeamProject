package com.green.teamproject_groupware.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class VacationRequestDto {
    private int empid;
    private Integer empno;
    private String name;
    private String position;
    private String vacationtype;
    private int vacationdays;
    private String reason;
    private Date startdate;
    private Date enddate;
    private String status;
    private Timestamp requestdate;
}
