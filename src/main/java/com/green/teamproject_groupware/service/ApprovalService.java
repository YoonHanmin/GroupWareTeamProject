package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.ApprovalDto;

public interface ApprovalService {
	public int docWrite(ApprovalDto dto);
	public ArrayList<ApprovalDto>getAllDoc(String empno);
	public ArrayList<ApprovalDto>getTodoDoc(String empno);
	public ApprovalDto getDocById(String doc_id);
	public ArrayList<ApprovalDto> getMyDoc(String empno);
	public ArrayList<ApprovalDto> getMyDoc_reject(String empno);
	public int doc_approval(HashMap<String, String> param);
	public int doc_reject(HashMap<String, String> param);
}
