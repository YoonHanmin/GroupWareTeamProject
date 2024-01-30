package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApprovalDto {
	private int doc_id;
	private int doc_empno;
	private String doc_name;
	private String doc_dname;
	private Timestamp doc_date;
	private String doc_expire;
	private String doc_confidential;
	private int first_empno;
	private int second_empno;
	private int third_empno;
	private int first_approval;
	private int second_approval;
	private int third_approval;
	private String doc_title;
	private String doc_content;
	private int doc_status;
	
}
