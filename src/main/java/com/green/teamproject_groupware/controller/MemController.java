package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dto.UserInfoDto;
import com.green.teamproject_groupware.service.MemService;
import com.green.teamproject_groupware.controller.MemController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
	@Autowired
	MemService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
	
	@RequestMapping("/login")
	public String login() {

		return "login";
	}
	
	@RequestMapping("/login_yn")
	public String login_yn(@RequestParam HashMap<String, String>param) {
//		log.info("@# login_yn");
		
		ArrayList<UserInfoDto> dtos = service.loginYn(param);
		
//		String mPw = request.getParameter("mem_pwd");
//		IMemDao dao = sqlSession.getMapper(IMemDao.class);
//		ArrayList<MemDto> dtos = dao.loginYn(request.getParameter("mem_uid")
//																			,request.getParameter("mem_pwd"));
		
		if (dtos.isEmpty()) {
			return "redirect:login";
		} else {
//			if (mPw.equals(dtos.get(0).getMem_pwd())) {
			if (param.get("mem_pwd").equals(dtos.get(0).getEmpno())) {
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
	
	@RequestMapping(value = "/employeeAuthentication", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> employeeAuthentication(@RequestParam("empno") String employeeNumber) {
	    // MyBatis를 사용하여 데이터베이스에서 사원번호 조회
	    HashMap<String, String> employeeInfo = service.getEmployeeInfo(Integer.parseInt(employeeNumber));

	    if (employeeInfo != null) {
	        // 사원번호가 존재하면 인증 성공
	        return ResponseEntity.ok("success");
	    } else {
	        // 사원번호가 존재하지 않으면 인증 실패
	        return ResponseEntity.badRequest().body("failure");
	    }
	}
		
	@RequestMapping(value="/mailCheck", method= RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{

		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 데이터 전송확인");
		System.out.println("이메일:"+email);
		/*인증번호 생성*/
		Random random=new Random();
		int checkNum=random.nextInt(888888)+111111;
		System.out.println("인증번호:"+checkNum);

		/*이메일 인증*/
		String setFrom="ohjay8118@gmail.com";
		String toMail=email;
		String title="GroupWare 회원가입 인증 메일입니다.";
		String content=
				"홈페이지를 방문해 주셔서 감사합니다"+
				"<br><br>"+
				"회원님의 인증번호는 "+checkNum	+"입니다."+
				"<br>"+
				"해당 인증번호를 비밀번호 확인란에 기입하여 주세요.";

		try{
			MimeMessage message=mailSender.createMimeMessage();
			MimeMessageHelper helper =new MimeMessageHelper(message, true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);

		}catch(Exception e) {
			e.printStackTrace();
		}
		String num=Integer.toString(checkNum);
		return num;
	}
}
