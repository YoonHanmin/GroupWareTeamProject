package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping("/receive")
	public String receive(@RequestParam(name = "username", required = false) String username, HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		log.info("@#유저네임은 ==>"+username);
		
//		검색명 없을시 전체 출력
		if(username ==null) {
		model.addAttribute("dto", dto);
		ArrayList<MsgDto> list = msgService.getReceiveMsg(empno);
		model.addAttribute("list",list);
		}
		else { // 검색명 있을시 해당 이름의 메일만 출력
			model.addAttribute("dto", dto);
			HashMap<String, String> param = new HashMap<>();
			EmpDto dtoByname = service.getEmpByName(username);
			String searchEmpno= ""+dtoByname.getEmpno();
			param.put("empno", empno);
			param.put("searchEmpno", searchEmpno);
			log.info("to_id ===>"+empno);
			log.info("from_id ===>"+searchEmpno);
			ArrayList<MsgDto> list = msgService.getMsgByEmpno(param);
			model.addAttribute("list",list);
		}
		return "msg/receive";
		
	}
//	보낸 메시지 모두 출력
	@RequestMapping("/send")
	public String send(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
	
		ArrayList<MsgDto> list = msgService.getSendMsg(empno);
		
		model.addAttribute("list",list);
		return "msg/send";
		
	}
	
	@RequestMapping("/searchName")
	@ResponseBody
	public EmpDto searchName(String name,Model model) {
		log.info("받은 empno ==>"+name);
			EmpDto dto = service.getEmpByName(name);
			return dto;
	}
	
	@RequestMapping("/sendMsg")
	@ResponseBody
	public String searchName(HttpSession session,Model model
			,@RequestParam("to_id")String to_id,@RequestParam("title")String title,@RequestParam("content")String content) {
		String id = (String)session.getAttribute("empno");
		int from_id=Integer.parseInt(id);
		MsgDto dto = new MsgDto();
		dto.setTo_id(Integer.parseInt(to_id));
		dto.setFrom_id(from_id);
		dto.setTitle(title);
		dto.setContent(content);
		String result = ""+msgService.sendMsg(dto);
		log.info("메세지 전송===>"+result);
		return result;
		
	}
	
	@PostMapping("/uphit")
	@ResponseBody
	public String uphit(@RequestParam("msgid")String msgid) {
		log.info("@@# msg id 는 ===>"+msgid);
		
		String result = ""+msgService.uphit(Integer.parseInt(msgid));
		log.info("@#@#@#reult ===>"+result);
	return result;
	}
	
}
