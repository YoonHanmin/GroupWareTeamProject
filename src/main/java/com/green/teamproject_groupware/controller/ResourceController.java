package com.green.teamproject_groupware.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	

	
	@GetMapping("/resource_approval")
	public String approval_write(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		
		String dname = dto.getDname();		
		String insaYn = "인사팀".equals(dname) ? "Y" : "N";
		
		if ("Y".equals(insaYn)) {
			ArrayList<SupplyDto> supplyList = sservice.supply_list(empno);
			ArrayList<VehicleDto> vehicleList = vservice.vehicle_list(empno);
			ArrayList<ExpenseDto> expenseList = eservice.expense_list(empno);
			ArrayList<ReservationDto> reservationList = rservice.reservation_list(empno);
	
			// todoCnt 확인할문서
			List<SupplyDto> todoSupplyList = supplyList.stream()
					.filter(t -> "0".equals(Integer.toString(t.getSupply_status())))
				    .collect(Collectors.toList());
			List<VehicleDto> todoVehicleList = vehicleList.stream()
					.filter(t -> "0".equals(Integer.toString(t.getVehicle_status())))
				    .collect(Collectors.toList());
			List<ExpenseDto> todoExpenseList = expenseList.stream()
					.filter(t -> "0".equals(Integer.toString(t.getExpense_status())))
				    .collect(Collectors.toList());
			List<ReservationDto> todoReservationList = reservationList.stream()
					.filter(t -> "0".equals(Integer.toString(t.getReservation_status())))
				    .collect(Collectors.toList());
			
			// ingCnt 승인한문서
			List<SupplyDto> ingSupplyList = supplyList.stream()
					.filter(t -> "1".equals(Integer.toString(t.getSupply_status())))
				    .collect(Collectors.toList());
			List<VehicleDto> ingVehicleList = vehicleList.stream()
					.filter(t -> "1".equals(Integer.toString(t.getVehicle_status())))
				    .collect(Collectors.toList());
			List<ExpenseDto> ingExpenseList = expenseList.stream()
					.filter(t -> "1".equals(Integer.toString(t.getExpense_status())))
				    .collect(Collectors.toList());
			List<ReservationDto> ingReservationList = reservationList.stream()
					.filter(t -> "1".equals(Integer.toString(t.getReservation_status())))
				    .collect(Collectors.toList());
			
			// rejectCnt 반려한문서
			List<SupplyDto> rejectSupplyList = supplyList.stream()
					.filter(t -> "2".equals(Integer.toString(t.getSupply_status())))
				    .collect(Collectors.toList());
			List<VehicleDto> rejectVehicleList = vehicleList.stream()
					.filter(t -> "2".equals(Integer.toString(t.getVehicle_status())))
				    .collect(Collectors.toList());
			List<ExpenseDto> rejectExpenseList = expenseList.stream()
					.filter(t -> "2".equals(Integer.toString(t.getExpense_status())))
				    .collect(Collectors.toList());
			List<ReservationDto> rejectReservationList = reservationList.stream()
					.filter(t -> "2".equals(Integer.toString(t.getReservation_status())))
				    .collect(Collectors.toList());
			
			int todoCnt = todoSupplyList.size() + todoVehicleList.size() + todoExpenseList.size() + todoReservationList.size();
			int ingCnt = ingSupplyList.size() + ingVehicleList.size() + ingExpenseList.size() + ingReservationList.size();;
			int rejectCnt = rejectSupplyList.size() + rejectVehicleList.size() + rejectExpenseList.size() + rejectReservationList.size();;
			
			model.addAttribute("supplyList", supplyList);
	        model.addAttribute("vehicleList", vehicleList);
	        model.addAttribute("expenseList", expenseList);
	        model.addAttribute("reservationList", reservationList);
	        
			model.addAttribute("todoCnt", todoCnt);
	        model.addAttribute("ingCnt", ingCnt);
	        model.addAttribute("rejectCnt", rejectCnt);
		}
		
		model.addAttribute("insaYn", insaYn);		
        
		return "res/resource_approval";
	}
	
	
	
	
	
	
	
	@GetMapping("/getSupplyList")
	public ResponseEntity<List<SupplyDto>> getSupplyList(HttpSession session) {
	    try {
//	    	세션을 통해서 empno를 받아옴
	    	String empno = (String) session.getAttribute("empno");
	    	
	        List<SupplyDto> supplyList = sservice.supply_list(empno);
	        return new ResponseEntity<>(supplyList, HttpStatus.OK);
	    } catch (Exception e) {
	        // 예외 발생 시 500 Internal Server Error 응답
	        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	@GetMapping("/getVehicleList")
	public ResponseEntity<List<VehicleDto>> getVehicleList(HttpSession session) {
		try {
			
			String empno = (String) session.getAttribute("empno");
			
			List<VehicleDto> vehicleList = vservice.vehicle_list(empno);
			return new ResponseEntity<>(vehicleList, HttpStatus.OK);
		} catch (Exception e) {
			// 예외 발생 시 500 Internal Server Error 응답
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/getExpenseList")
	public ResponseEntity<List<ExpenseDto>> getExpenseList(HttpSession session) {
		try {
			
			String empno = (String) session.getAttribute("empno");
			
			List<ExpenseDto> expenseList = eservice.expense_list(empno);
			return new ResponseEntity<>(expenseList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping("/getReservationList")
	public ResponseEntity<List<ReservationDto>> getReservationList(HttpSession session) {
		try {
			
			String empno = (String) session.getAttribute("empno");
			
			List<ReservationDto> reservationList = rservice.reservation_list(empno);
			return new ResponseEntity<>(reservationList, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@RequestMapping("/resource_apply")
	public String resource(HttpSession session,Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		log.info("FB컨트롤러 유저이름===>"+dto.getName());
		log.info("FB컨트롤러 프사이름===>"+dto.getProfileimage());
		
		return "res/resource_apply";
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

	 @PostMapping("/deleteSupply")
	 @ResponseBody
	 public String deleteSupply(@RequestBody Map<String, Object> payload) {
		 try {
		        Object supplyIdObject = payload.get("supply_id");
		        
		        if (supplyIdObject != null) {
		            // supply_id가 null이 아닌 경우에만 처리
		            String supplyIdAsString = supplyIdObject.toString();
		            sservice.supply_delete(supplyIdAsString);
		            return "삭제 성공";
		        } else {
		            return "삭제 실패 - supply_id가 없음!!";
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return "삭제 실패 - 예외 발생";
		    }
	 }
	 
	 @PostMapping("/deleteVehicle")
	 @ResponseBody
	 public String deleteVehicle(@RequestBody Map<String, Object> payload) {
		 try {
			 Object vehicleIdObject = payload.get("vehicle_id");
			 
			 if (vehicleIdObject != null) {
				 String vehicleIdAsString = vehicleIdObject.toString();
				 vservice.vehicle_delete(vehicleIdAsString);
				 return "삭제 성공";
			 } else {
				 return "삭제 실패 - vehicle_id가 없음!!";
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
			 return "삭제 실패 - 예외 발생";
		 }
	 }
	 
	 @PostMapping("/deleteExpense")
	 @ResponseBody
	 public String deleteExpense(@RequestBody Map<String, Object> payload) {
		 try {
			 Object expenseIdObject = payload.get("expense_id");
			 
			 if (expenseIdObject != null) {
				 String expenseIdAsString = expenseIdObject.toString();
				 eservice.expense_delete(expenseIdAsString);
				 return "삭제 성공";
			 } else {
				 return "삭제 실패 - expense_id가 없음!!";
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
			 return "삭제 실패 - 예외 발생";
		 }
	 }
	 
	 @PostMapping("/deleteReservation")
	 @ResponseBody
	 public String deleteReservation(@RequestBody Map<String, Object> payload) {
		 try {
			 Object reservationIdObject = payload.get("reservation_id");
			 
			 if (reservationIdObject != null) {
				 String reservationIdAsString = reservationIdObject.toString();
				 rservice.reservation_delete(reservationIdAsString);
				 return "삭제 성공";
			 } else {
				 return "삭제 실패 - expense_id가 없음!!";
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
			 return "삭제 실패 - 예외 발생";
		 }
	 }


//	 @PostMapping("/approvalSupply")
//	 @ResponseBody
//	 public String supplyApprovalUpdate(@RequestBody Map<String, Object> payload) {
//		 try {
//		        Object supplyIdObject = payload.get("supply_id");
//		        
//		        if (supplyIdObject != null) {
//		            // supply_id가 null이 아닌 경우에만 처리
//		            String supplyIdAsString = supplyIdObject.toString();
//		            sservice.supplyApprovalUpdate(supplyIdAsString);
//		            return "supplyApprovalUpdate 성공";
//		        } else {
//		            return "supplyApprovalUpdate 실패";
//		        }
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		        return "supplyApprovalUpdate 예외 발생";
//		    }
//	 }
//	 
//	 @PostMapping("/rejectSupply")
//	 @ResponseBody
//	 public String supplyRejectUpdate(@RequestBody Map<String, Object> payload) {
//		 try {
//			 Object supplyIdObject = payload.get("supply_id");
//			 
//			 if (supplyIdObject != null) {
//				 // supply_id가 null이 아닌 경우에만 처리
//				 String supplyIdAsString = supplyIdObject.toString();
//				 sservice.supplyRejectUpdate(supplyIdAsString);
//				 return "supplyRejectUpdate 성공";
//			 } else {
//				 return "supplyRejectUpdate 실패";
//			 }
//		 } catch (Exception e) {
//			 e.printStackTrace();
//			 return "supplyRejectUpdate 예외 발생";
//		 }
//	 }
//	 
//	 @PostMapping("/approvalVehicle")
//	 @ResponseBody
//	 public String vehicleApprovalUpdate(@RequestBody Map<String, Object> payload) {
//		 try {
//			 Object vehicleIdObject = payload.get("vehicle_id");
//			 
//			 if (vehicleIdObject != null) {
//				 String vehicleIdAsString = vehicleIdObject.toString();
//				 vservice.vehicleApprovalUpdate(vehicleIdAsString);
//				 return "vehicleApprovalUpdate 성공";
//			 } else {
//				 return "vehicleApprovalUpdate 실패";
//			 }
//		 } catch (Exception e) {
//			 e.printStackTrace();
//			 return "vehicleApprovalUpdate 예외 발생";
//		 }
//	 }
//	 
//	 @PostMapping("/rejectVehicle")
//	 @ResponseBody
//	 public String vehicleRejectUpdate(@RequestBody Map<String, Object> payload) {
//		 try {
//			 Object vehicleIdObject = payload.get("vehicle_id");
//			 
//			 if (vehicleIdObject != null) {
//				 String vehicleIdAsString = vehicleIdObject.toString();
//				 vservice.vehicleRejectUpdate(vehicleIdAsString);
//				 return "vehicleRejectUpdate 성공";
//			 } else {
//				 return "vehicleRejectUpdate 실패";
//			 }
//		 } catch (Exception e) {
//			 e.printStackTrace();
//			 return "vehicleRejectUpdate 예외 발생";
//		 }
//	 }
//	 
//	 @PostMapping("/approvalExpense")
//	 @ResponseBody
//	 public String expenseApprovalUpdate(@RequestBody Map<String, Object> payload) {
//		 try {
//			 Object expenseIdObject = payload.get("expense_id");
//			 
//			 if (expenseIdObject != null) {
//				 String expenseIdAsString = expenseIdObject.toString();
//				 eservice.expenseApprovalUpdate(expenseIdAsString);
//				 return "expenseApprovalUpdate 성공";
//			 } else {
//				 return "expenseApprovalUpdate 실패";
//			 }
//		 } catch (Exception e) {
//			 e.printStackTrace();
//			 return "expenseApprovalUpdate 예외 발생";
//		 }
//	 }
//	 
//	 @PostMapping("/rejectExpense")
//	 @ResponseBody
//	 public String expenseRejectUpdate(@RequestBody Map<String, Object> payload) {
//		 try {
//			 Object expenseIdObject = payload.get("expense_id");
//			 
//			 if (expenseIdObject != null) {
//				 String expenseIdAsString = expenseIdObject.toString();
//				 eservice.expenseRejectUpdate(expenseIdAsString);
//				 return "expenseRejectUpdate 성공";
//			 } else {
//				 return "expenseRejectUpdate 실패";
//			 }
//		 } catch (Exception e) {
//			 e.printStackTrace();
//			 return "expenseRejectUpdate 예외 발생";
//		 }
//	 }
	 
	 
	 
	 
	 @PostMapping("/approvalUpdate")
	 @ResponseBody
	 public String approvalUpdate(@RequestBody Map<String, Object> payload) {
		 try {
		        Object resourceIdObject = payload.get("resourceId");
		        Object resourceFlagObject = payload.get("resourceFlag");
		        		        
		        if (resourceIdObject != null) {
		        	String resourceIdAsString = resourceIdObject.toString();
		        	
		        	if ("supply".equals(resourceFlagObject.toString())) {
			            // supply_id가 null이 아닌 경우에만 처리
			            sservice.supplyApprovalUpdate(resourceIdAsString);
		        	} else if ("vehicle".equals(resourceFlagObject.toString())) {
			            // vehicle_id가 null이 아닌 경우에만 처리
			            vservice.vehicleApprovalUpdate(resourceIdAsString);
		        	} else if ("expense".equals(resourceFlagObject.toString())) {
			            // expense_id가 null이 아닌 경우에만 처리
		        		eservice.expenseApprovalUpdate(resourceIdAsString);
		        	} else if ("reservation".equals(resourceFlagObject.toString())) {
			            // reservation_id가 null이 아닌 경우에만 처리
		        		rservice.reservationApprovalUpdate(resourceIdAsString);
		        	}
		        	
		            return "approvalUpdate 성공";
		        } else {
		            return "approvalUpdate 실패";
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return "approvalUpdate 예외 발생";
		    }
	 }
	 
	 
	 @PostMapping("/rejectUpdate")
	 @ResponseBody
	 public String rejectUpdate(@RequestBody Map<String, Object> payload) {
		 try {
			 Object resourceIdObject = payload.get("resourceId");
			 Object resourceFlagObject = payload.get("resourceFlag");
			 
			 if (resourceIdObject != null) {
				 String resourceIdAsString = resourceIdObject.toString();
				 
				 if ("supply".equals(resourceFlagObject.toString())) {
					 // supply_id가 null이 아닌 경우에만 처리
					 sservice.supplyRejectUpdate(resourceIdAsString);
				 } else if ("vehicle".equals(resourceFlagObject.toString())) {
					 // vehicle_id가 null이 아닌 경우에만 처리
					 vservice.vehicleRejectUpdate(resourceIdAsString);
				 } else if ("expense".equals(resourceFlagObject.toString())) {
					 // expense_id가 null이 아닌 경우에만 처리
					 eservice.expenseRejectUpdate(resourceIdAsString);
				 } else if ("reservation".equals(resourceFlagObject.toString())) {
					 // reservation_id가 null이 아닌 경우에만 처리
					 rservice.reservationRejectUpdate(resourceIdAsString);
				 }
				 
				 return "rejectUpdate 성공";
			 } else {
				 return "rejectUpdate 실패";
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
			 return "rejectUpdate 예외 발생";
		 }
	 }
	 
	 

//	@GetMapping("/chkDept")
//	public ResponseEntity<String> chkDept(HttpSession session,Model model) {
//		try {
//			String dname = (String) session.getAttribute("dname");		
//			String insaYn = "인사팀".equals(dname) ? "Y" : "N";
//			
//			return new ResponseEntity<>(insaYn, HttpStatus.OK);
//		} catch (Exception e) {
//			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//	}
	 
}
