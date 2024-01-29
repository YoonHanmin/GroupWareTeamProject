package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.SupplyDto;

public interface SupplyService {
	public ArrayList<SupplyDto> supply_list();
	public void write(SupplyDto formData);
//	public void write(HashMap<String, String> param);
//	public boolean  write(SupplyDto request);
	public SupplyDto contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	
}
