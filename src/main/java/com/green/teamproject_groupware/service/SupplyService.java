package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.SupplyDto;

public interface SupplyService {
	public ArrayList<SupplyDto> supply_list(String empno);
	public void supply_write(SupplyDto formData1);
//	public void write(HashMap<String, String> param);
//	public boolean  write(SupplyDto request);
	public SupplyDto supply_contentView(HashMap<String, String> param);
//	public void supply_modify(HashMap<String, String> param);
//	public void supply_delete(HashMap<String, String> param);
	public void supply_delete(String supply_id);
	public void supplyApprovalUpdate(String supply_id);
	public void supplyRejectUpdate(String supply_id);

}
