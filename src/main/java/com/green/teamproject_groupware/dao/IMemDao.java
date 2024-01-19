package com.green.teamproject_groupware.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.green.teamproject_groupware.dto.MemDto;



public interface IMemDao {

	public ArrayList<MemDto> loginYn(String id, String pw);
	public void write(String mem_uid, String mem_pwd, String mem_name);
}
