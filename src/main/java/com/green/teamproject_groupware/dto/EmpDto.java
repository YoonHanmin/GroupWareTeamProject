package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

public class EmpDto {
	
private int empno;
private String position;
private String name;
private String email;
private String password;
private int sal;
private Timestamp hiredate;
private String jumin;
private String phone;
private String address;
private String account;
private String profileimage;
private String dname;
private String status;
private Timestamp birthday;
private String grade;
}
