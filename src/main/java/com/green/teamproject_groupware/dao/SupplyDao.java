package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.green.teamproject_groupware.dto.SupplyDto;

public interface SupplyDao {
	public ArrayList<SupplyDto> supply_list();
	 public void write(SupplyDto formData);
//	public void write(HashMap<String, String> param);
	public SupplyDto contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
