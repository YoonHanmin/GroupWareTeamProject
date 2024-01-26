package com.green.teamproject_groupware.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.MsgDto;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.MsgService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MsgController {
	@Autowired
	EmpService service;
	@Autowired
	MsgService msgService;
	
//	메신저 메인화면 유저정보 가져오는 메소드
	@RequestMapping("/messenger")
	public String messenger(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		
		return "msg/messenger";
	}
//	받은 메시지 모두 출력
	@RequestMapping("/receive")
	public String receive(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		ArrayList<MsgDto> list = msgService.getReceiveMsg(empno);
		log.info("@#보내는이 프로필 ==>"+list.get(0).getFrom_profileimage());
		log.info("@#받는이 프로필 ==>"+list.get(0).getTo_profileimage());
		model.addAttribute("list",list);
		return "msg/receive";
		
	}
//	보낸 메시지 모두 출력
	@RequestMapping("/send")
	public String send(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		
	
		ArrayList<MsgDto> list = msgService.getSendMsg(empno);
		model.addAttribute("list",list);
		return "msg/send";
		
	}
	
	
	
}
