package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.PBReplyDTO;

public interface PBReplyService {
	public ArrayList<PBReplyDTO> prlist();
	public void prwrite(HashMap<String, String> param);
	public void prmodify(HashMap<String, String> param);
	public void prdelete(HashMap<String, String> param);
}
