package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PBReplyDTO {
	private int prid;
	private int pid;
	private String prwriter;
	private String prcontent;
	private Timestamp pregdate;
}
