package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.ResourceApprovalDto;

public interface ResourceApprovalDao {
	public ArrayList<ResourceApprovalDto>getTodoDoc(String supply_id);
	public ResourceApprovalDto getDocById(String supply_id);
	public int doc_approval(HashMap<String, String> param);
	public int doc_reject(HashMap<String, String> param);
}
