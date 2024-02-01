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
import com.green.teamproject_groupware.dto.ReservationDto;
import com.green.teamproject_groupware.dto.SupplyDto;
import com.green.teamproject_groupware.dto.VehicleDto;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.ExpenseService;
import com.green.teamproject_groupware.service.ReservationService;
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
	@Autowired
	ReservationService rservice;
	
	
	
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
	
//	@RequestMapping("/getSupplyList")
//    @ResponseBody
//    public ArrayList<SupplyDto> getSupplyList() {
//        // Supply 리스트를 가져오는 로직을 구현하고 HTML 형식으로 반환
//		ArrayList<SupplyDto> supplyList = sservice.supply_list();
//        StringBuilder htmlResponse = new StringBuilder();
//        
//        for (SupplyDto supply : supplyList) {
//            htmlResponse.append("<div class='supply-item'>");
//            htmlResponse.append("<div>").append(supply.getSupply_id()).append("</div>");
//            htmlResponse.append("<div>").append(supply.getSempno()).append("</div>");
//            htmlResponse.append("<div>").append(supply.getItem()).append("</div>");
//            htmlResponse.append("<div>").append(supply.getQuantity()).append("</div>");
//            htmlResponse.append("<div>").append(supply.getSdescription()).append("</div>");
//            htmlResponse.append("<div>").append(supply.getSdate()).append("</div>");
//        }
//        
//        return sservice.supply_list();
//    }
//	
	
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
	
	@RequestMapping("/reservation_list")
	public String reservation_list(HttpSession session, Model model) {
		log.info("@# reservation_list");
		
		String empno = (String) session.getAttribute("empno");
		EmpDto empDto = empservice.getEmpByEmpno(empno);
		model.addAttribute("empDto", empDto);
		
		// 비품 목록을 가져와 모델에 추가
		ArrayList<ReservationDto> reservationList = rservice.reservation_list();
		model.addAttribute("reservationList",reservationList);
		
		return "res/reservation_list";
	}
	
	@RequestMapping("/submitSuppliesForm")
	public String supply_write(SupplyDto param) {
	    log.info("@# submitSuppliesForm");
	    
	    sservice.supply_write(param);
	    
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
		 
	@RequestMapping("/submitReservationForm")
	public String reservation_write(ReservationDto param) {
		log.info("@# submitVehicleForm");
		
		rservice.reservation_write(param);
		
		return "redirect:/reservation_list";
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
	 
	 @PostMapping("/submitReservationForm")
	 @ResponseBody
	 public String reservationHandleFormSubmission(@RequestBody ReservationDto formData4) {
		 try {
			 // 데이터베이스에 데이터 삽입 로직
			 rservice.reservation_write(formData4);
			 
			 // 성공적으로 데이터가 삽입되면 "Form submitted successfully" 응답
			 return "reservation_write formData submitted successfully";
		 } catch (Exception e) {
			 // 데이터 삽입 중에 오류가 발생하면 오류 메시지를 응답
			 return "Error reservation_write submitting the formData: " + e.getMessage();
		 }
	 }


	@RequestMapping("/supply_content_view")
	public String supply_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# supply_content_view");
		
		SupplyDto supplyDto = sservice.supply_contentView(param);
		model.addAttribute("supply_content_view", supplyDto);
		
		return "res/supply_content_view";
	}	
	
	@RequestMapping("/vehicle_content_view")
	public String vehicle_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# vehicle_content_view");
		
		VehicleDto vehicleDto = vservice.vehicle_contentView(param);
		model.addAttribute("vehicle_content_view", vehicleDto);
		
		return "res/vehicle_content_view";
	}	
	
	@RequestMapping("/expense_content_view")
	public String expense_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# expense_content_view");
		
		ExpenseDto expenseDto = eservice.expense_contentView(param);
		model.addAttribute("expense_content_view", expenseDto);
		
		return "res/expense_content_view";
	}	
	
	@RequestMapping("/reservation_content_view")
	public String reservation_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# reservation_content_view");
		
		ReservationDto reservationDto = rservice.reservation_contentView(param);
		model.addAttribute("reservation_content_view", reservationDto);
		
		return "res/reservation_content_view";
	}	
}
