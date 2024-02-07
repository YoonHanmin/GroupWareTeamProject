package com.green.teamproject_groupware.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.teamproject_groupware.dto.ApprovalDto;
import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.NotificationDto;
import com.green.teamproject_groupware.service.ApprovalService;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.NotifyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApprovalController {

	@Autowired
	EmpService empservice;
	
	@Autowired
	ApprovalService appservice;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@Autowired
	NotifyService notifyService;
	
	@GetMapping("/approval")
	public String approval(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto",dto);
		String doc_empno = empno;
		
		ArrayList<ApprovalDto> list = appservice.getAllDoc(doc_empno);
		model.addAttribute("list", list);
//		내가 결재해야할 문서를 출력
		ArrayList<ApprovalDto> todoList = appservice.getTodoDoc(empno);
		model.addAttribute("todoList", todoList);
		try {
//			Json으로 변환하여 전달
		model.addAttribute("todoList_json", objectMapper.writeValueAsString(todoList));
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		ArrayList<NotificationDto> notifyList = notifyService.getNotification(empno);
//		몇분전 설정 세팅
		for (int i = 0; i < notifyList.size(); i++) {
			String minute = calculateTime(notifyList.get(i).getNotify_time());
			notifyList.get(i).setMinute(minute);
		}
	
		model.addAttribute("notifyList", notifyList);
//		내가 결재한 문서 출력
		ArrayList<ApprovalDto> ingList = appservice.getMyDoc(empno);
		model.addAttribute("ingList",ingList);
		ArrayList<ApprovalDto> rejectList = appservice.getMyDoc_reject(empno);
		model.addAttribute("rejectList",rejectList);
		
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
		log.info("dto는 ===>>>"+approvalDto);
		String doc_img =""+approvalDto.getDoc_empno();
		approvalDto.setDoc_img(doc_img);
		String result = ""+appservice.docWrite(approvalDto);
		return result;
	}
	
	@PostMapping("/getDocById")
	@ResponseBody
	public ResponseEntity<ApprovalDto> getDocById(String doc_id) {
		ApprovalDto docDto = appservice.getDocById(doc_id);
		return new ResponseEntity<>(docDto,HttpStatus.OK);
	}
	
	@GetMapping("/showStamp")
	@ResponseBody
	public ResponseEntity<byte[]> showStamp(String fileName){
		log.info("도장 사진 이름 ==>"+fileName);
//		업로드 파일 경로 + 이름
		File file = new File("D:\\dev\\ProjectUpload\\stamp\\"+fileName);
		
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders header = new HttpHeaders();
		try {
//		HttpHeaders 객체 생성후 add(컨텐츠타입,경로)메소드로 파일타입을 HTTP 헤더에 추가
			header.add("Content-Type", Files.probeContentType(file.toPath()));
//			파일 정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return result;
	}
	
	@GetMapping("/doc_approval")
	@ResponseBody
	public String doc_approval(@RequestParam("empno")String empno,@RequestParam("doc_id")String doc_id) {
		HashMap<String, String>param = new HashMap<>();
		param.put("empno", empno);
		param.put("doc_id",doc_id);
		String result = ""+appservice.doc_approval(param);
		return result;
		
	}
	@GetMapping("/doc_reject")
	@ResponseBody
	public String doc_reject(@RequestParam("empno")String empno,@RequestParam("doc_id")String doc_id) {
		HashMap<String, String>param = new HashMap<>();
		param.put("empno", empno);
		param.put("doc_id",doc_id);
		String result = ""+appservice.doc_reject(param);
		return result;
		
	}
	 private static class TIME_MAXIMUM {
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
}
