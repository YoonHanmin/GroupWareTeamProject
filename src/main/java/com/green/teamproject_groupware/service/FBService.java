package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.FBCriteria;
import com.green.teamproject_groupware.dto.FBDto;

public interface FBService {
	public ArrayList<FBDto> free_board_list();
	public void write(HashMap<String, String>param);
	public FBDto contentView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
	public void increaseHit(HashMap<String, String> param);
	
	public ArrayList<FBDto> list(FBCriteria cri);
	public int getTotalCount(FBCriteria cri);
}
