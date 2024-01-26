package com.green.teamproject_groupware.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.service.EmpService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResourceController {
	@Autowired
	EmpService empservice;
	
	@RequestMapping("/resource_apply")
	public String resource(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		log.info("FB컨트롤러 유저이름===>"+dto.getName());
		log.info("FB컨트롤러 프사이름===>"+dto.getProfileimage());
		
		
		return "res/resource_apply";
	}
	
    @PostMapping("/submitSuppliesForm")
    public ResponseEntity<String> submitSuppliesForm(@RequestParam String itemName,
                                                     @RequestParam int quantity,
                                                     @RequestParam String purpose) {
        // 여기서 받은 데이터를 데이터베이스에 저장하거나 다른 비즈니스 로직에 따라 처리합니다.
        // ...

        // 간단한 응답을 반환 (실제로는 필요에 따라 응답을 구성할 수 있습니다)
        return ResponseEntity.ok("폼 제출이 성공적으로 처리되었습니다.");
    }
	
	
}
