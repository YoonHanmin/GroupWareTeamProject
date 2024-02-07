package com.green.teamproject_groupware.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.teamproject_groupware.dao.VacationDao;
import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.ExpenseDto;
import com.green.teamproject_groupware.dto.NotificationDto;
import com.green.teamproject_groupware.dto.ReservationDto;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.VacationApprovalDto;
import com.green.teamproject_groupware.dto.VacationRequestDto;
import com.green.teamproject_groupware.dto.VehicleDto;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.NotifyService;
import com.green.teamproject_groupware.service.VacationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VacationController {
	
    @Autowired
    private VacationService service;
    
    @Autowired
	EmpService empService;
    @Autowired
    NotifyService notifyService;

    @RequestMapping(value="/vacationRequest", method=RequestMethod.GET)
    public String vacationRequest(HttpSession session, Model model) {
        String empno = (String) session.getAttribute("empno");
        EmpDto dto = empService.getEmpByEmpno(empno);
        model.addAttribute("dto", dto);
        
        ArrayList<NotificationDto> notifyList = notifyService.getNotification(empno);
//		몇분전 설정 세팅
		for (int i = 0; i < notifyList.size(); i++) {
			String minute = calculateTime(notifyList.get(i).getNotify_time());
			notifyList.get(i).setMinute(minute);
		}
	
		model.addAttribute("notifyList", notifyList);
        // 휴가 데이터를 가져오는 부분
        ArrayList<VacationRequestDto> vacationEvents = service.getVacationEvents(empno);
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

        return "vacation/vacationRequest";
    }

    
    @RequestMapping(value = "/submitVacationRequest", method = RequestMethod.POST)
    @ResponseBody
    public String submitVacationRequest(HttpSession session, Model model,
            @RequestParam HashMap<String, String> param) {
        String empno = (String) session.getAttribute("empno");
        log.info("세션에서 가져온 empno: " + empno);

        EmpDto dto = empService.getEmpByEmpno(empno);

        VacationRequestDto vacationDTO = new VacationRequestDto();

        // empno를 DTO에 설정
        try {
            vacationDTO.setEmpno(Integer.parseInt(empno));
        } catch (NumberFormatException e) {
            vacationDTO.setEmpno(0); // 기본값으로 설정하거나 예외 처리
        }

        vacationDTO.setName(dto.getName());
        vacationDTO.setPosition(dto.getPosition());
        vacationDTO.setVacationtype(param.get("vacationtype"));

        // vacationdays가 null이 아닌 경우에만 변환 시도
        if (param.get("vacationdays") != null && !param.get("vacationdays").isEmpty()) {
            vacationDTO.setVacationdays(param.get("vacationdays"));
        }

        vacationDTO.setReason(param.get("reason"));

        // startDate와 endDate를 문자열에서 Date로 변환하여 설정
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            String startDateString = param.get("startdate");
            String endDateString = param.get("enddate");

            if (startDateString != null && endDateString != null) {
                java.sql.Date startdate = new java.sql.Date(dateFormat.parse(startDateString).getTime());
                java.sql.Date enddate = new java.sql.Date(dateFormat.parse(endDateString).getTime());
                vacationDTO.setStartdate(startdate);
                vacationDTO.setEnddate(enddate);
            } else {
                log.error("날짜 형식이 잘못되었거나 값이 없습니다.");
            }
        } catch (Exception e) {
            log.error("날짜 파싱 중 오류 발생.", e);
        }

        vacationDTO.setStatus("신청");

        service.vacationRequest(vacationDTO);

        model.addAttribute("message", "휴가 신청이 제출되었습니다.");
        return "success";
    }

    @RequestMapping(value="/myVacationRequests", method=RequestMethod.GET)
    public String myVacationRequests(HttpSession session, Model model) {
        String empno = (String) session.getAttribute("empno");
        EmpDto dto = empService.getEmpByEmpno(empno);
        model.addAttribute("dto", dto);
        
        List<VacationRequestDto> list = service.myVacationRequests(empno);
        model.addAttribute("myVacationRequests", list);
        return "vacation/myVacationRequests";
    }
    
    @RequestMapping(value = "/cancelVacation", method = RequestMethod.POST)
    @ResponseBody
    public String cancelVacation(HttpSession session,Model model, @RequestParam("empid") String empid) {
    	log.info(empid);
        try {
            // 취소 로직 수행: VacationDao.cancelVacation(empid)를 호출하는 코드
        	service.cancelVacation(Integer.parseInt(empid));
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    

	
    @RequestMapping(value="/vacationApproval", method=RequestMethod.GET)
    public String vacationApproval(HttpSession session, Model model) {
        String empno = (String) session.getAttribute("empno");
        EmpDto dto = empService.getEmpByEmpno(empno);
        model.addAttribute("dto", dto);
        
		String dname = dto.getDname();		
		String insaYn = "인사팀".equals(dname) ? "Y" : "N";
		
		if ("Y".equals(insaYn)) {
        
        List<VacationRequestDto> vacationList = service.vacationApproval(empno);
        model.addAttribute("vacationApproval", vacationList);

        // '신청', '승인', '반려' 상태에 따른 데이터 갯수 카운트
        int tovacnt = 0; // 미승인 휴가 카운트
        int ingCnt = 0; // 승인 완료 휴가 카운트
        int rejectCnt = 0; // 휴가 반려 카운트

        for (VacationRequestDto vacation : vacationList) {
            if ("신청".equals(vacation.getStatus())) {
                tovacnt++;
            } else if ("승인".equals(vacation.getStatus())) {
                ingCnt++;
            } else if ("반려".equals(vacation.getStatus())) {
                rejectCnt++;
            }
        }

        // 모델에 각각의 카운트 추가
        model.addAttribute("tovacnt", tovacnt);
        model.addAttribute("ingCnt", ingCnt);
        model.addAttribute("rejectCnt", rejectCnt);
		}
		
		model.addAttribute("insaYn", insaYn);		

        return "vacation/vacationApproval";
    }
    
    @PostMapping("/vacationApprovalUpdate")
    @ResponseBody
    public String vacationApprovalUpdate(@RequestBody Map<String, String> request) {
        try {
            String empid = request.get("empid");
            service.vacationApprovalUpdate(Integer.parseInt(empid));
            // 알림
//            notificationService.sendEvent(String.valueOf(dto.getTo_id()), "NewMsg", dto);
            return "approvalUpdate 성공";
        } catch (Exception e) {
            e.printStackTrace();
            return "approvalUpdate 예외 발생";
        }
    }

    @PostMapping("/vacationRejectUpdate")
    @ResponseBody
    public String vacationRejectUpdate(@RequestBody Map<String, String> request) {
        try {
            String empid = request.get("empid");
            service.vacationRejectUpdate(Integer.parseInt(empid));
            return "rejectUpdate 성공";
        } catch (Exception e) {
            e.printStackTrace();
            return "rejectUpdate 예외 발생";
        }
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