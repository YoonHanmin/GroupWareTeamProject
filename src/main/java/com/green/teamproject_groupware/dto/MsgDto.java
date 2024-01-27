package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MsgDto {
	private int msgid;
	private int to_id;
	private int from_id;
	private String title;
	private String content;
	private Timestamp time;
	private int hit;
	private String to_name;
	private String to_position;
	private String to_dname;
	private String to_profileimage;
	private String to_email;
	private String from_name;
	private String from_position;
	private String from_dname;
	private String from_profileimage;
	private String from_email;
	private String from_phone;
	private String from_status;
	private Timestamp from_hiredate;
	
	
	
}
