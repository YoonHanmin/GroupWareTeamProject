//package com.green.teamproject_groupware.controller;
//
//import java.sql.Timestamp;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.green.teamproject_groupware.dao.VacationDao;
//import com.green.teamproject_groupware.dto.EmpDto;
//import com.green.teamproject_groupware.dto.VacationRequestDto;
//import com.green.teamproject_groupware.service.EmpService;
//import com.green.teamproject_groupware.service.VacationService;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Controller
//@Slf4j
//public class VacationController2 {
//	
//    @Autowired
//    private VacationService service;
//    
//    @Autowired
//	EmpService empService;
//    
//
//    @RequestMapping(value="/vacationRequest")
//    public String vacationRequest(HttpSession session, Model model) {
//        String empno = (String) session.getAttribute("empno");
//        EmpDto dto = empService.getEmpByEmpno(empno);
//        model.addAttribute("dto",dto);
//
//        return "vacation/vacationRequest";
//    }
//    
//    @RequestMapping(value = "/submitVacationRequest", method = RequestMethod.POST)
//    @ResponseBody
//    public String submitVacationRequest(HttpSession session, Model model,
//            @RequestParam HashMap<String, String> param) {
//        String empno = (String) session.getAttribute("empno");
//        log.info("세션에서 가져온 empno: " + empno);
//
//        EmpDto dto = empService.getEmpByEmpno(empno);
//
//        VacationRequestDto vacationDTO = new VacationRequestDto();
//
//        // empno를 DTO에 설정
//        try {
//            vacationDTO.setEmpno(Integer.parseInt(empno));
//        } catch (NumberFormatException e) {
//            vacationDTO.setEmpno(0); // 기본값으로 설정하거나 예외 처리
//        }
//
//        vacationDTO.setName(dto.getName());
//        vacationDTO.setPosition(dto.getPosition());
//        vacationDTO.setVacationtype(param.get("vacationtype"));
//
//        // vacationdays가 null이 아닌 경우에만 변환 시도
//        if (param.get("vacationdays") != null && !param.get("vacationdays").isEmpty()) {
//            vacationDTO.setVacationdays(param.get("vacationdays"));
//        }
//
//        vacationDTO.setReason(param.get("reason"));
//
//        // startDate와 endDate를 문자열에서 Date로 변환하여 설정
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//
//        try {
//            String startDateString = param.get("startdate");
//            String endDateString = param.get("enddate");
//
//            if (startDateString != null && endDateString != null) {
//                java.sql.Date startdate = new java.sql.Date(dateFormat.parse(startDateString).getTime());
//                java.sql.Date enddate = new java.sql.Date(dateFormat.parse(endDateString).getTime());
//                vacationDTO.setStartdate(startdate);
//                vacationDTO.setEnddate(enddate);
//            } else {
//                log.error("날짜 형식이 잘못되었거나 값이 없습니다.");
//            }
//        } catch (Exception e) {
//            log.error("날짜 파싱 중 오류 발생.", e);
//        }
//
//        vacationDTO.setStatus("신청");
//
//        service.vacationRequest(vacationDTO);
//
//        model.addAttribute("message", "휴가 신청이 제출되었습니다.");
//        return "success";
//    }
//
//
//    @RequestMapping(value="/myVacationRequests", method=RequestMethod.GET)
//    public String myVacationRequests(HttpSession session, Model model) {
//        String empno = (String) session.getAttribute("empno");
//        EmpDto dto = empService.getEmpByEmpno(empno);
//        model.addAttribute("dto", dto);
//        
//        List<VacationRequestDto> list = service.myVacationRequests(empno);
//        model.addAttribute("myVacationRequests", list);
//        return "vacation/myVacationRequests";
//    }
//    
////    @RequestMapping(value = "/checkDuplicateVacation", method = RequestMethod.POST)
////    @ResponseBody
////    public String checkDuplicateVacation(@RequestParam HashMap<String, String> param) {
////        String empno = param.get("empno");
////        String startdate = param.get("startdate");
////        String enddate = param.get("enddate");
////
////        // 중복 여부 확인을 위한 서비스 메소드 호출
////        boolean isDuplicate = service.checkDuplicateVacation(empno, startdate, enddate);
////
////        // 중복 여부에 따라 결과 반환
////        return isDuplicate ? "duplicate" : "not_duplicate";
////    }
//    
//    @RequestMapping(value = "/cancelVacation", method = RequestMethod.POST)
//    @ResponseBody
//    public String cancelVacation(HttpSession session,Model model, @RequestParam("empid") String empid) {
//    	log.info(empid);
//        try {
//            // 취소 로직 수행: 예시로 VacationDao.cancelVacation(empid)를 호출하는 코드
//            service.cancelVacation(Integer.parseInt(empid));
//            return "success";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "error";
//        }
//    }
//    @RequestMapping(value="/vacationApproval", method=RequestMethod.GET)
//    public String vacationApproval(HttpSession session, Model model) {
//        String empno = (String) session.getAttribute("empno");
//        EmpDto dto = empService.getEmpByEmpno(empno);
//        model.addAttribute("dto", dto);
//
//        ArrayList<VacationRequestDto> list2 = service.vacationApproval(empno);
//        model.addAttribute("vacationApproval", list2);
//        
//        return "vacation/vacationApproval";
//    }
//}