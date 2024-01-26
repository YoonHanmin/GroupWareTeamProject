package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.FBCriteria;
import com.green.teamproject_groupware.dto.FBDto;
import com.green.teamproject_groupware.dto.PageDTO;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.FBService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FBController {
	
	@Autowired
	private FBService service;
	@Autowired
	private EmpService empservice;
	

	@RequestMapping("/free_board_list_old")
	public String list(Model model) {
		log.info("@# list");
		
		ArrayList<FBDto> free_board_list = service.free_board_list();
		model.addAttribute("free_board_list", free_board_list);
				
		return "free_board_list";
	}
	
	@RequestMapping("/free_board_list")
	public String list(HttpSession session, FBCriteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri===>"+cri);
		
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		log.info("FB컨트롤러 유저이름===>"+dto.getName());
		log.info("FB컨트롤러 프사이름===>"+dto.getProfileimage());
		
		model.addAttribute("free_board_list", service.list(cri));
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		
		return "community/freeboard";
	}
	
//	@RequestMapping("/free_board_list")
//	public String list(Model model) {
//		log.info("@# free_board_list");
//		
//		ArrayList<FBDto> free_board_list = service.free_board_list();
//		model.addAttribute("free_board_list", free_board_list);
//				
//		return "free_board_list";
//	}
	
	@RequestMapping("/write")
	public String write(@RequestParam HashMap<String, String> param) {
	    log.info("@# write");
	    // 게시글 작성 부분
	    service.write(param);
	    
	    return "redirect:free_board_list";
	}	
	
	@RequestMapping("/write_view")
	public String write_view() {
		log.info("@# write_view");
		 
		return "write_view";
	}
	
	@RequestMapping("/content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view");
		
		FBDto boarddto = service.contentView(param);
		model.addAttribute("content_view", boarddto);
		model.addAttribute("pageMaker", param);
		
		service.increaseHit(param);
		
		return "content_view";
	}
	
	@RequestMapping("/modify")
//	@ModelAttribute("cri") Criteria cri : Criteria객체를 cri로 받는다
//	RedirectAttributes rttr : 쿼리 스트링 뒤에 추가
	public String modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") FBCriteria cri, RedirectAttributes rttr) {
		log.info("@# modify");
		
		service.modify(param);
//		각각을 붙여서 rttr로 넘겨주겠다
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:free_board_list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") FBCriteria cri, RedirectAttributes rttr) {
		log.info("@# delete");
		
		service.delete(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:free_board_list";
	}
}
	
