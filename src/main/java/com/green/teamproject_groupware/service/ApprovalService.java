package com.green.teamproject_groupware.service;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.ApprovalDto;

public interface ApprovalService {
	public int docWrite(ApprovalDto dto);
	public ArrayList<ApprovalDto>getAllDoc(String empno);
	public ArrayList<ApprovalDto>getTodoDoc(String empno);
}
