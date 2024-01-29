package com.green.teamproject_groupware.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.SupplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResourceController {
	@Autowired
	EmpService empservice;
	@Autowired
	SupplyService sservice;
	
	@RequestMapping("/resource_apply")
	public String resource(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		log.info("FB컨트롤러 유저이름===>"+dto.getName());
		log.info("FB컨트롤러 프사이름===>"+dto.getProfileimage());
		

		
		return "res/resource_apply";
	}
	
	@RequestMapping("/supply_list")
	public String list(HttpSession session, Model model) {
	    log.info("@# supply_list");

	    String empno = (String) session.getAttribute("empno");
	    EmpDto empDto = empservice.getEmpByEmpno(empno);
	    model.addAttribute("empDto", empDto);

	    // 비품 목록을 가져와 모델에 추가
	    ArrayList<SupplyDto> supplyList = sservice.supply_list();
	    model.addAttribute("supplyList", supplyList);

	    return "res/supply_list";
	}

	
	@RequestMapping("/submitSuppliesForm")
	public String write(SupplyDto param) {
	    log.info("@# submitSuppliesForm");
	    // 게시글 작성 부분
	    sservice.write(param);
	    
//	    return "redirect:res/resource_apply";
	    return "redirect:/supply_list";
	}	
	
	 
	 @PostMapping("/submitForm")
	    @ResponseBody
	    public String handleFormSubmission(@RequestBody SupplyDto formData) {
		 try {
		        // 데이터베이스에 데이터 삽입 로직
		        sservice.write(formData);

		        // 성공적으로 데이터가 삽입되면 "Form submitted successfully" 응답
		        return "Form submitted successfully";
		    } catch (Exception e) {
		        // 데이터 삽입 중에 오류가 발생하면 오류 메시지를 응답
		        return "Error submitting the form: " + e.getMessage();
		    }
	    }


	@RequestMapping("/supply_content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# supply_content_view");
		
		SupplyDto dto = sservice.contentView(param);
		model.addAttribute("supply_content_view", dto);
		
		return "res/supply_content_view";
	}
}
