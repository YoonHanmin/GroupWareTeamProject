package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.PBCriteria;
import com.green.teamproject_groupware.dto.PBDto;

public interface PBService {
	public ArrayList<PBDto> picture_list();
	public void pwrite(HashMap<String, String> param);
	public PBDto pcontentView(HashMap<String, String> param);
	public void pmodify(HashMap<String, String> param);
	public void pdelete(HashMap<String, String> param);
	public void pincreaseHit(HashMap<String, String> param);
	public void uploadFile(HashMap<String, String> param);
	
	public ArrayList<PBDto> plist(PBCriteria pcri);
	public int getTotalCount(PBCriteria pcri);
}
