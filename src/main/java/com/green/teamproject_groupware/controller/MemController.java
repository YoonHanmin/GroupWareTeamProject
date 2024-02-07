package com.green.teamproject_groupware.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teamproject_groupware.dao.IMemDao;
import com.green.teamproject_groupware.dao.NotificationDao;
import com.green.teamproject_groupware.dto.ApprovalDto;
import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.MsgDto;
import com.green.teamproject_groupware.dto.NoticeDto;
import com.green.teamproject_groupware.dto.NotificationDto;
import com.green.teamproject_groupware.dto.UserInfoDto;
import com.green.teamproject_groupware.dto.VacationRequestDto;
import com.green.teamproject_groupware.service.ApprovalService;
import com.green.teamproject_groupware.service.MemService;
import com.green.teamproject_groupware.service.MsgService;
import com.green.teamproject_groupware.service.NoticeService;
import com.green.teamproject_groupware.service.NotifyService;
import com.green.teamproject_groupware.service.VacationService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.teamproject_groupware.controller.MemController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemController {
	@Autowired
	MemService service;	
	@Autowired
	NotifyService notifyService;	
	@Autowired
	MsgService msgService;
	@Autowired
	private JavaMailSender mailSender;
    @Autowired
    SqlSession sqlSession; 
    @Autowired
    NoticeService noticeService;
    @Autowired
    ApprovalService appservice;
    @Autowired
    VacationService vacationService;
    
    public static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
    
 
    
    public static String calculateTime(Timestamp date) {
		long curTime = System.currentTimeMillis();
		long regTime = date.getTime();
		long diffTime = (curTime - regTime) / 1000;
		
		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = diffTime + "초 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분 전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// day
			msg = (diffTime) + "달 전";
		} else {
			msg = (diffTime) + "년 전";
		}
		return msg;
	}


	@RequestMapping("/main")
	public String main(HttpSession session,Model model) {
		String empno = (String)session.getAttribute("empno");
		ArrayList<NoticeDto> noticeList = noticeService.notice_list();
		model.addAttribute("noticeList", noticeList);		
		ArrayList<ApprovalDto> todoList = appservice.getTodoDoc(empno);
		model.addAttribute("todoList", todoList);
		ArrayList<ApprovalDto> ingList = appservice.getMyDoc(empno);
		model.addAttribute("ingList",ingList);
		
		//		메인_전자결재 알림 전송
	
//		메인_알림 읽음처리
	
		ArrayList<NotificationDto> notifyList = notifyService.getNotification(empno);
//		몇분전 설정 세팅
		for (int i = 0; i < notifyList.size(); i++) {
			String minute = calculateTime(notifyList.get(i).getNotify_time());
			notifyList.get(i).setMinute(minute);
		}
	
		model.addAttribute("notifyList", notifyList);
		
		
		// 휴가 데이터를 가져오는 부분
		ArrayList<VacationRequestDto> vacationEvents = vacationService.getVacationEvents(empno);
		// Java 객체를 JSON 문자열로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		String vacationEventsJson = null;
		try {
			vacationEventsJson = objectMapper.writeValueAsString(vacationEvents);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		// 모델에 JSON 데이터 추가
		model.addAttribute("vacationEventsJson", vacationEventsJson);
		
		
		
		
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
	@RequestMapping("/read")
	public ResponseEntity<String> read(@RequestParam("notify_id")String notify_id) {
		notifyService.read(notify_id);
		return new ResponseEntity<String>("success",HttpStatus.OK);
		
	}
	
	@RequestMapping("/login")
	public String login() {

		return "login";
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
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // 로그아웃 후 리다이렉트할 경로를 지정합니다.
        return "redirect:/login";
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
	
	@RequestMapping("/signUp")
	public String signUp(@RequestParam HashMap<String, String> param, HttpSession session) {
	    log.info("@# signUp");

	    // 회원가입 정보를 DB에 저장
	    UserInfoDto userInfoDto = new UserInfoDto();
	    userInfoDto.setEmpno(param.get("empno"));
	    userInfoDto.setName(param.get("name"));

	    userInfoDto.setPassword(param.get("password"));
	    userInfoDto.setEmail(param.get("email"));
	    userInfoDto.setTel(param.get("tel"));
	    userInfoDto.setAddress(param.get("address"));

	    sqlSession.getMapper(IMemDao.class).signUp(userInfoDto);

	    // 회원 가입 성공 시 세션에 사용자 정보 저장
	    session.setAttribute("empno", param.get("empno"));

	    return "redirect:/login"; 
	}
	
	@RequestMapping("/findPW")
	public String findPW() {
		return "findPW";
	}
	
	
	
	@RequestMapping("/checkempno")
	@ResponseBody
	public String checkEmpno(String empno,Model model) {
		log.info("받은 empno ==>"+empno);
			String result = ""+service.checkEmpno(empno);
			return result;
	}
	
	@RequestMapping("/checkemail")
	@ResponseBody
	public String checkEmail(@RequestBody HashMap<String, String>param,HttpSession session,Model model) {
			log.info("@#이메일 ==>"+param.get("email"));
			log.info("@사번==>"+param.get("empno"));
			
		log.info("받은 값 ==>"+param);
			String result = ""+service.checkEmail(param);
			if(result.equals("1")) {
				session.setAttribute("emailVerified", true);
				
			}
			return result;
	}
	
	@RequestMapping("/changePW")
	public String changePW(HttpSession session) {
//		인증여부 검사함
		Boolean emailVerified = (Boolean) session.getAttribute("emailVerified");
		if (emailVerified != null && emailVerified) {
	        // 변경 비밀번호 페이지로 이동
	        return "changePW";
	    } else {
	        // 이메일 인증이 되지 않았으면 다른 페이지로 리다이렉트 또는 에러 처리
	        return "redirect:/login"; // 예시로 로그인 페이지로 리다이렉트
	    }
		
	}
	
	@RequestMapping(value="/mailCheck", method= RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception{
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		log.info("이메일 데이터 전송확인");
		log.info("이메일:"+email);
		/*인증번호 생성*/
		Random random=new Random();
		int checkNum=random.nextInt(888888)+111111;
		log.info("인증번호:"+checkNum);

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
