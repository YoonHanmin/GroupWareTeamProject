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
import com.green.teamproject_groupware.dto.ReservationDto;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.VacationApprovalDto;
import com.green.teamproject_groupware.dto.VacationRequestDto;
import com.green.teamproject_groupware.dto.VehicleDto;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.VacationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VacationController {
	
    @Autowired
    private VacationService service;
    
    @Autowired
	EmpService empService;
    

    @RequestMapping(value="/vacationRequest", method=RequestMethod.GET)
    public String vacationRequest(HttpSession session, Model model) {
        String empno = (String) session.getAttribute("empno");
        EmpDto dto = empService.getEmpByEmpno(empno);
        model.addAttribute("dto", dto);

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
    
    // 휴가 승인 처리
    @PostMapping("/vacationApprovalUpdate")
    @ResponseBody
    public String vacationApprovalUpdate(@RequestBody Map<String, String> request) {
        try {
            String empid = request.get("empid");
            service.vacationApprovalUpdate(Integer.parseInt(empid));
            return "approvalUpdate 성공";
        } catch (Exception e) {
            e.printStackTrace();
            return "approvalUpdate 예외 발생";
        }
    }
    
 // 승인된 휴가 일수 가져오기
    @GetMapping("/getApprovedVacationDays")
    @ResponseBody
    public int getApprovedVacationDays(HttpSession session) {
        String empno = (String) session.getAttribute("empno");
        // 여기에 승인된 휴가 일수를 가져오는 서비스 메소드를 호출합니다.
        int approvedVacationDays = service.getApprovedVacationDays(empno);
        return approvedVacationDays;
    }
    
    // 휴가 반려 처리
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
}