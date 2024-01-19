package com.green.teamproject_groupware.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dto.MemDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/login")
	public String login() {
		log.info("@# login");
		
		return "login";
	}
	
	@RequestMapping("/login_yn")
	public String login_yn(HttpServletRequest request, Model model) {
		log.info("@# login_yn");
		
		String mPw = request.getParameter("mem_pwd");
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		ArrayList<MemDto> dtos = dao.loginYn(request.getParameter("mem_uid")
																			,request.getParameter("mem_pwd"));
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
			if (mPw.equals(dtos.get(0).getMem_pwd())) {
				return "redirect:login_ok";
			} else {
			    return "redirect:login";
			}
		}				
	}
	
	@RequestMapping("/login_ok")
	public String login_ok() {
		log.info("@# login_ok");
		
		return "login_ok";
	}
	
	@RequestMapping("/register")
	public String register() {
		log.info("@# register");
		
		return "register";
	}
	
	@RequestMapping("/registerOk")
	public String registerOk(HttpServletRequest request, Model model) {
		log.info("@# registerOk");
		
		IMemDao dao = sqlSession.getMapper(IMemDao.class);
		dao.write(request.getParameter("mem_uid")
        				, request.getParameter("mem_pwd")
        				, request.getParameter("mem_name"));
		
		return "redirect:login";
	}
}
