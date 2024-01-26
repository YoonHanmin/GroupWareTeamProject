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
public class RsourceController {
	@Autowired
	EmpService empservice;
	
	
	@RequestMapping("/resource")
	public String resource(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		log.info("FB컨트롤러 유저이름===>"+dto.getName());
		log.info("FB컨트롤러 프사이름===>"+dto.getProfileimage());
		
		
		return "res/resource_apply";
	}
	
}
