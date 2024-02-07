package com.green.teamproject_groupware.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	
	
	
	
	
	
	@PostMapping("/searchPeople")
    public ModelAndView searchEmployee(HttpServletRequest req) throws UnsupportedEncodingException {
		
		ModelAndView mav = new ModelAndView();
		req.setCharacterEncoding("UTF-8");
		
		String employeeSearch = req.getParameter("employeeSearch");
		String searchType = req.getParameter("searchType");
		
		
		ArrayList<EmpDto> list = service.getSearchEmp(employeeSearch, searchType);
		
		
		 // 디버깅을 위한 출력
	    System.out.println("Search Result Size: " + list.size());
	    for (EmpDto dto : list) {
	        System.out.println(dto.toString());
	    }
		
//		 mav.addObject("searchResult", list);  // 수정된 부분: "list2" → "searchResult"
//		    mav.setViewName("searchEmployee");
		    
//		    return mav;
		mav.addObject("list", list);
		mav.setViewName("people");
				
		return mav;	
    }
	
	
	
	
	
	
	
	
	
}