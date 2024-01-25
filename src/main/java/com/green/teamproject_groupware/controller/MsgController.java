package com.green.teamproject_groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.service.EmpService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MsgController {
	@Autowired
	EmpService service;
	
	@RequestMapping("/messenger")
	public String messenger(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		
		return "messenger";
	}
}
