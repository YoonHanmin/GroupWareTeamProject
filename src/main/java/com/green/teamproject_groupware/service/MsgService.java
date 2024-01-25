package com.green.teamproject_groupware.service;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.MsgDto;

public interface MsgService {
	public ArrayList<MsgDto> getReceiveMsg(String empno);
	public ArrayList<MsgDto> getSendMsg(String empno);
}
