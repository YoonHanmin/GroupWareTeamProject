package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.ui.Model;

import com.green.teamproject_groupware.dto.MemDto;



public interface MemService {

	public ArrayList<MemDto> loginYn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}
