package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResourceApprovalDto {
	private int doc_id;
	private int approval;
	private Timestamp first_approval;
}
