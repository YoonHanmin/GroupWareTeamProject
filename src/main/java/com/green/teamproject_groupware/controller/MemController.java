package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/findPW")
	public String findPW() {
		return "findPW";
		
	}
	
	
	
	@RequestMapping("/login")
	public String login() {

		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		
//		현재 세션이 있으면 세션을 반환, 없으면 새로 생성하지말고 null을 반환
		HttpSession session = request.getSession(false);
		if (session != null) { // 세션이 null이 아니면 = 현재 세션이 있으면
            session.invalidate(); 
        }
		return "redirect:login";
	}
	
	
//	로그인 메소드
	@RequestMapping("/loginYn")
	public String login_yn(@RequestParam HashMap<String, String>param,HttpSession session) {
		int result = service.loginYn(param);
		log.info("@#@#result ===>"+result);
		
		String empno = param.get("empno");
		log.info("empno ====>"+empno);
		if(result==1) { // 로그인 성공        
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
	
	@RequestMapping("/checkempno")
	@ResponseBody
	public String checkEmpno(String empno,Model model) {
		log.info("받은 empno ==>"+empno);

			String result = ""+service.checkEmpno(empno);
			
			return result;
			
//			model.addAttribute("result", result);

	}
	@RequestMapping("/checkemail")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email,@RequestParam("empno")String empno,Model model) {
		log.info("받은 email ==>"+email);
		log.info("받은 empno ==>"+empno);
		
		HashMap<String, String> param = new HashMap<>();
		param.put("email",email);
		param.put("empno",empno);
		
		
			String result = ""+service.checkEmail(param);
			
			return result;
			
//			model.addAttribute("result", result);

	}
	
	
	
}
