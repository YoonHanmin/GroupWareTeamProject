package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.VehicleDto;

public interface VehicleDao {
	public ArrayList<VehicleDto> vehicle_list();
	 public void vehicle_write(VehicleDto formData2);
//	public void write(HashMap<String, String> param);
	public VehicleDto vehicle_contentView(HashMap<String, String> param);
	public void vehicle_modify(HashMap<String, String> param);
	public void vehicle_delete(HashMap<String, String> param);
}
