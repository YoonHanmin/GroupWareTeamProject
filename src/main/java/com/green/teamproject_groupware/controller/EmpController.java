package com.green.teamproject_groupware.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.service.EmpService;

@Controller
public class EmpController {
	
	@Autowired
	EmpService service;
	
	@RequestMapping("/people")
	public String people(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		ArrayList<EmpDto> list = service.getEmp();
		model.addAttribute("list", list);
		
		return "people";
	}
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		EmpDto dto = service.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		
		return "myinfo";
	}
	
	
	
	
}
