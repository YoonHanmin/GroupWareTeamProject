package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.UserInfoDto;
import com.green.teamproject_groupware.service.MemService;
import com.green.teamproject_groupware.controller.MemController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
	@Autowired
	MemService service;
	
	@RequestMapping("/main")
	public String main(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		
		if(empno !=null) {
		EmpDto user = service.getUserByEmpno(Integer.parseInt(empno));
		model.addAttribute("user", user);
		 log.info("name ==>"+user.getName());
		
		 if(user !=null) {
		return "main";
		 }
		}
		 return "redirect:/login";
	}
	
	
	@RequestMapping("/login")
	public String login() {

		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    // 세션 제거
	    session.invalidate();
	    
	    // 로그인 페이지로 리다이렉트
	    return "redirect:login";
	}
	
//	로그인 메소드
	@RequestMapping("/loginYn")
	public String login_yn(@RequestParam HashMap<String, String>param,HttpSession session) {
		int result = service.loginYn(param);
		log.info("@#@#result ===>"+result);
		
		String empno = param.get("empno");
		log.info("empno ====>"+empno);
		if(result==1) {
			session.setAttribute("empno", empno);
			
			return "redirect:main";
		}else {
			return "redirect:login";
		}
	
	}
	
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@# login_ok");
		
		return "login_ok";
	}
	
	@RequestMapping("/regist")
	public String regist() {
		log.info("@# regist");
		
		return "regist";
	}
	
	@RequestMapping("/registerOk")
	public String registerOk(@RequestParam HashMap<String, String>param) {
		log.info("@# registerOk");
		
		service.write(param);
		
		return "redirect:login";
	}
}
