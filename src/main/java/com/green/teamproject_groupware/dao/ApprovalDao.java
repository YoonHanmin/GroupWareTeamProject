package com.green.teamproject_groupware.dao;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.ApprovalDto;

public interface ApprovalDao {
		
	public int docWrite(ApprovalDto dto);
	public ArrayList<ApprovalDto>getAllDoc(String empno);
	// 내 결제차례인 문서를 조회하는 메소드
	public ArrayList<ApprovalDto>getTodoDoc(String empno);
	
}
