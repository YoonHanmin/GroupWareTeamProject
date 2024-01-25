package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.teamproject_groupware.dto.NoticeCriteria;
import com.green.teamproject_groupware.dto.NoticeDto;
import com.green.teamproject_groupware.dto.NoticePageDTO;
import com.green.teamproject_groupware.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NoticeController {
	
	@Autowired
	private NoticeService nservice;

	@RequestMapping("/notice_list_old")
	public String nlist(Model model) {
		log.info("@# list");
		
		ArrayList<NoticeDto> notice_list = nservice.notice_list();
		model.addAttribute("notice_list", notice_list);
				
		return "notice_list";
	}
	
	@RequestMapping("/notice_list")
	public String nlist(NoticeCriteria ncri, Model model) {
		log.info("@# list");
		log.info("@# cri===>"+ncri);
		
		model.addAttribute("notice_list", nservice.nlist(ncri));
		int total = nservice.getTotalCount(ncri);
		model.addAttribute("pageMaker", new NoticePageDTO(total, ncri));
		
		
		return "notice_list";
	}
	
	@RequestMapping("/nwrite")
	public String nwrite(@RequestParam HashMap<String, String> param) {
	    log.info("@# nwrite");
	    // 게시글 작성 부분
	    nservice.nwrite(param);
	    
	    return "redirect:notice_list";
	}	
	
	@RequestMapping("/notice_write_view")
	public String notice_write_view() {
		log.info("@# notice_write_view");
		
		return "notice_write_view";
	}
	
	@RequestMapping("/notice_content_view")
	public String notice_content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# notice_content_view");
		
		NoticeDto dto = nservice.ncontentView(param);
		model.addAttribute("ncontentView", dto);
		model.addAttribute("pageMaker", param);
		
		nservice.nincreaseHit(param);
		log.info("@# notice_content_view>>>>>>>>>>>>>>>>>>"+dto.getNcontent());
		
		return "notice_content_view";
	}
	
	@RequestMapping("/nmodify")
//	@ModelAttribute("cri") Criteria cri : Criteria객체를 cri로 받는다
//	RedirectAttributes rttr : 쿼리 스트링 뒤에 추가
	public String nmodify(@RequestParam HashMap<String, String> param, @ModelAttribute("ncri") NoticeCriteria ncri, RedirectAttributes rttr) {
		log.info("@# nmodify");
		
		nservice.nmodify(param);
//		각각을 붙여서 rttr로 넘겨주겠다
//		페이지 이동시 뒤에 페이지번호, 글 갯수 추가
		rttr.addAttribute("npageNum", ncri.getNpageNum());
		rttr.addAttribute("namount", ncri.getNamount());
		
		return "redirect:notice_list";
	}
	
	@RequestMapping("/ndelete")
	public String ndelete(@RequestParam HashMap<String, String> param, @ModelAttribute("ncri") NoticeCriteria ncri, RedirectAttributes rttr) {
		log.info("@# ndelete");
		
		nservice.ndelete(param);
		rttr.addAttribute("npageNum", ncri.getNpageNum());
		rttr.addAttribute("namount", ncri.getNamount());
		
		return "redirect:notice_list";
	}
}
