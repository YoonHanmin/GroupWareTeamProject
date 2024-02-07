package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotificationDto {
	private String notify_id;
	private String notify_type;
	private String notify_receiver;
	private String notify_sender;
	private Timestamp notify_time;
	private int msg_id;
	private int doc_id;
	private String empno;
	private String minute;
	
	 public String getNotify_type() {
	        return notify_type;
	    }
}
