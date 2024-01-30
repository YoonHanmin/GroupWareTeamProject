package com.green.teamproject_groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teamproject_groupware.dto.ApprovalDto;
import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.service.ApprovalService;
import com.green.teamproject_groupware.service.EmpService;

@Controller
public class ApprovalController {

	@Autowired
	EmpService empservice;
	
	@Autowired
	ApprovalService appservice;
	
	@GetMapping("/approval")
	public String approval(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto",dto);
		return "document/approval";
	}
	@GetMapping("/approval_write")
	public String approval_write(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto",dto);
		return "document/approval_write";
	}
	
	@PostMapping("/docWrite")
	@ResponseBody
	public String approval_docWrite(@RequestBody ApprovalDto approvalDto,HttpSession session,Model model) {
		String result = ""+appservice.docWrite(approvalDto);
		return result;
	}
	
	
}
