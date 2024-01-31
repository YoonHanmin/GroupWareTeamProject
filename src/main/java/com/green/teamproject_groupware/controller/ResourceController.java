package com.green.teamproject_groupware.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.ExpenseDto;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.VehicleDto;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.ExpenseService;
import com.green.teamproject_groupware.service.SupplyService;
import com.green.teamproject_groupware.service.VehicleService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ResourceController {
	@Autowired
	EmpService empservice;
	@Autowired
	SupplyService sservice;
	@Autowired
	VehicleService vservice;
	@Autowired
	ExpenseService eservice;
	
	
	@RequestMapping("/resource_apply")
	public String resource(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		log.info("FB컨트롤러 유저이름===>"+dto.getName());
		log.info("FB컨트롤러 프사이름===>"+dto.getProfileimage());
		

		
		return "res/resource_apply";
	}
	
	@RequestMapping("/supply_list")
	public String supply_list(HttpSession session, Model model) {
	    log.info("@# supply_list");

	    String empno = (String) session.getAttribute("empno");
	    EmpDto empDto = empservice.getEmpByEmpno(empno);
	    model.addAttribute("empDto", empDto);

	    // 비품 목록을 가져와 모델에 추가
	    ArrayList<SupplyDto> supplyList = sservice.supply_list();
	    model.addAttribute("supplyList", supplyList);

	    return "res/supply_list";
	}
	
	@RequestMapping("/vehicle_list")
	public String vehicle_list(HttpSession session, Model model) {
		log.info("@# vehicle_list");
		
		String empno = (String) session.getAttribute("empno");
		EmpDto empDto = empservice.getEmpByEmpno(empno);
		model.addAttribute("empDto", empDto);
		
		// 비품 목록을 가져와 모델에 추가
		ArrayList<VehicleDto> vehicleList = vservice.vehicle_list();
		model.addAttribute("vehicleList",vehicleList);
		
		return "res/vehicle_list";
	}
	
	@RequestMapping("/expense_list")
	public String expense_list(HttpSession session, Model model) {
		log.info("@# expense_list");
		
		String empno = (String) session.getAttribute("empno");
		EmpDto empDto = empservice.getEmpByEmpno(empno);
		model.addAttribute("empDto", empDto);
		
		// 비품 목록을 가져와 모델에 추가
		ArrayList<ExpenseDto> expenseList = eservice.expense_list();
		model.addAttribute("expenseList",expenseList);
		
		return "res/expense_list";
	}

	
	@RequestMapping("/submitSuppliesForm")
	public String supply_write(SupplyDto param1) {
	    log.info("@# submitSuppliesForm");
	    
	    sservice.supply_write(param1);
	    
	    return "redirect:/supply_list";
	}	
	
	@RequestMapping("/submitVehicleForm")
	public String vehicle_write(VehicleDto param) {
		log.info("@# submitVehicleForm");
		
		vservice.vehicle_write(param);
		
		return "redirect:/vehicle_list";
	}	
	
	@RequestMapping("/submitExpenseForm")
	public String expense_write(ExpenseDto param) {
		log.info("@# submitVehicleForm");
		
		eservice.expense_write(param);
		
		return "redirect:/expense_list";
	}	
		 
	 @PostMapping("/submitSuppliesForm")
	 @ResponseBody
	    public String spplyHandleFormSubmission(@RequestBody SupplyDto formData) {
		 try {
		        // 데이터베이스에 데이터 삽입 로직
		        sservice.supply_write(formData);

		        // 성공적으로 데이터가 삽입되면 "Form submitted successfully" 응답
		        return "supply_write formData submitted successfully";
		    } catch (Exception e) {
		        // 데이터 삽입 중에 오류가 발생하면 오류 메시지를 응답
		        return "Error supply_write submitting the formData: " + e.getMessage();
		    }
	    }
	 
	 @PostMapping("/submitVehicleForm")
	 @ResponseBody
	 public String vehicleHandleFormSubmission(@RequestBody VehicleDto formData2) {
		 try {
			 // 데이터베이스에 데이터 삽입 로직
			 vservice.vehicle_write(formData2);
			 
			 // 성공적으로 데이터가 삽입되면 "Form submitted successfully" 응답
			 return "vehicle_write formData submitted successfully";
		 } catch (Exception e) {
			 // 데이터 삽입 중에 오류가 발생하면 오류 메시지를 응답
			 return "Error vehicle_write submitting the formData: " + e.getMessage();
		 }
	 }
	 
	 @PostMapping("/submitExpenseForm")
	 @ResponseBody
	 public String expenseHandleFormSubmission(@RequestBody ExpenseDto formData3) {
		 try {
			 // 데이터베이스에 데이터 삽입 로직
			 eservice.expense_write(formData3);
			 
			 // 성공적으로 데이터가 삽입되면 "Form submitted successfully" 응답
			 return "expense_write formData submitted successfully";
		 } catch (Exception e) {
			 // 데이터 삽입 중에 오류가 발생하면 오류 메시지를 응답
			 return "Error expense_write submitting the formData: " + e.getMessage();
		 }
	 }


	@RequestMapping("/supply_content_view")
	public String supply_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# supply_content_view");
		
		SupplyDto dto = sservice.supply_contentView(param);
		model.addAttribute("supply_content_view", dto);
		
		return "res/supply_content_view";
	}	
	
	@RequestMapping("/vehicle_content_view")
	public String vehicle_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# vehicle_content_view");
		
		VehicleDto dto = vservice.vehicle_contentView(param);
		model.addAttribute("vehicle_content_view", dto);
		
		return "res/vehicle_content_view";
	}	
	
	@RequestMapping("/expense_content_view")
	public String expense_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# expense_content_view");
		
		ExpenseDto dto = eservice.expense_contentView(param);
		model.addAttribute("expense_content_view", dto);
		
		return "res/expense_content_view";
	}	
}
