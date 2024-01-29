package com.green.teamproject_groupware.dao;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.MsgDto;

public interface MsgDao {
	public ArrayList<MsgDto> getReceiveMsg(String empno);
	public ArrayList<MsgDto> getSendMsg(String empno);
	public int sendMsg(MsgDto dto);
}
