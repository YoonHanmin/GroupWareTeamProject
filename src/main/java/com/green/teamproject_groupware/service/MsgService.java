package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.MsgDto;

public interface MsgService {
	public ArrayList<MsgDto> getReceiveMsg(String empno);
	public ArrayList<MsgDto> getSendMsg(String empno);
	public int sendMsg(MsgDto dto);
	public ArrayList<MsgDto> getMsgByEmpno(HashMap<String, String> param);
	public int uphit(int msgid);
	public ArrayList<MsgDto> getNotifyMsgByEmpno(String empno);
}
