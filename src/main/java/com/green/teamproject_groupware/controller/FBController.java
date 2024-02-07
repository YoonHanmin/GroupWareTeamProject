package com.green.teamproject_groupware.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.FBCriteria;
import com.green.teamproject_groupware.dto.FBDto;
import com.green.teamproject_groupware.dto.FBReply2DTO;
import com.green.teamproject_groupware.dto.FBReplyDTO;
import com.green.teamproject_groupware.dto.PageDTO;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.FBReply2Service;
import com.green.teamproject_groupware.service.FBReplyService;
import com.green.teamproject_groupware.service.FBService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FBController {
	
	@Autowired
	private FBService service;
	
	@Autowired
	private FBReplyService replyService;
	
	@Autowired
	private FBReply2Service rreplyService;
	
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
		
		model.addAttribute("free_board_list", service.list(cri));
		int total = service.getTotalCount(cri);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		
		return "community/freeboard";
	}
	
	@RequestMapping("/write")
	public String write(HttpSession session, @RequestParam HashMap<String, String> param, Model model) {
	    
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		log.info("empno~~~" + empno);
		
		FBDto fbDto = new FBDto();
		try {
			fbDto.setEmpno(Integer.parseInt(empno));
		} catch(NumberFormatException e) {
			fbDto.setEmpno(0);
		}
		
		fbDto.setBname(dto.getName());
		
		service.write(param);
	    
	    return "redirect:free_board_list";
	}	
	
	@RequestMapping("/write_view")
	public String write_view(HttpSession session, Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		FBDto fbDto = new FBDto();
		try {
			fbDto.setEmpno(Integer.parseInt(empno));
		} catch(NumberFormatException e) {
			fbDto.setEmpno(0);
		}
		
		fbDto.setBname(dto.getName());
		
		return "write_view";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpSession session, @RequestParam HashMap<String, String> param, Model model) {
		
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		FBDto fbDto = new FBDto();
		try {
			fbDto.setEmpno(Integer.parseInt(empno));
		} catch(NumberFormatException e) {
			fbDto.setEmpno(0);
		}
		
		fbDto.setBname(dto.getName());
		
		log.info("bid~~~" + param.get("bid"));
		
		FBDto boarddto = service.contentView(param);
		model.addAttribute("content_view", boarddto);
		model.addAttribute("pageMaker", param);
		
		log.info("bid~~~" + param.get("bid"));
		
		int bid = Integer.parseInt(param.get("bid").trim());
		model.addAttribute("rlist", replyService.rlist(bid));
		
		model.addAttribute("bid", bid);
		
		service.increaseHit(param);
		
		return "content_view";
	}
	
	@RequestMapping("/free_modify")
	public String free_modify(HttpSession session, @RequestParam HashMap<String, String> param, Model model) {
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		FBDto fbDto = new FBDto();
		try {
			fbDto.setEmpno(Integer.parseInt(empno));
		} catch(NumberFormatException e) {
			fbDto.setEmpno(0);
		}
		
		FBDto freedto= service.contentView(param);
		model.addAttribute("content_view", freedto);
		model.addAttribute("pageMaker", param);
		
		service.increaseHit(param);
		
		return "free_modify";
	}
	
	@RequestMapping("/modify")
	public String modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") FBCriteria cri,
			RedirectAttributes rttr) {

		param.put("bname", param.get("bname"));
		param.put("btitle", param.get("btitle"));
		param.put("bcontent", param.get("bcontent"));

		FBDto freedto = service.contentView(param);

		service.modify(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:content_view?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount()
				+ "&bid=" + freedto.getBid() + " ";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") FBCriteria cri, RedirectAttributes rttr) {
		service.delete(param);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:free_board_list";
	}
	

	@GetMapping("/rlist")
	public String rlist(@RequestParam("bid") int bid, Model model) {
		model.addAttribute("prlist", replyService.rlist(bid));
		return "content_view";
	}

	@GetMapping("/rwrite")
	public String rwrite(@RequestParam("bid") int bid, Model model) {
		model.addAttribute("bid", bid);
		
		return "reply_write";
	}

	@RequestMapping(value = "/rwrite", method = RequestMethod.POST)
	public String rwrite(@ModelAttribute FBReplyDTO dto, @ModelAttribute("cri") FBCriteria cri,
			RedirectAttributes rttr) {
		// 댓글 작성
		replyService.rwrite(dto);

		// 댓글 목록 페이지로 리다이렉트
		return "redirect:content_view?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount()
				+ "&bid=" + dto.getBid();
	}


	@RequestMapping("/rdelete")
	public String relete(@ModelAttribute FBReplyDTO dto, @ModelAttribute("cri") FBCriteria cri,
			RedirectAttributes rttr) {
		replyService.rdelete(dto);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:content_view?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount()
				+ "&bid=" + dto.getBid();
	}
	
	 // 대댓글 목록
    @GetMapping("/rrlist")
    public String rrlist(@RequestParam("bid") int bid, @RequestParam("parentrid") int parentrid, Model model) {
        model.addAttribute("rrlist", rreplyService.rrlist(bid, parentrid));
        return "content_view"; 
    }

    // 대댓글 작성
    @GetMapping("/rrwrite")
    public String rrwrite(@RequestParam("bid") int bid, @RequestParam("parentPrid") int parentrid, Model model) {
        model.addAttribute("bid", bid);
        model.addAttribute("parentrid", parentrid);
        return "rreply_write"; 
    }

    @RequestMapping(value = "/rrwrite", method = RequestMethod.POST)
    public String rrwrite(@ModelAttribute FBReply2DTO dto, @ModelAttribute("cri") FBCriteria cri,
                           RedirectAttributes rttr) {
        // 대댓글 작성
        rreplyService.rrwrite(dto);

        // 대댓글 목록 페이지로 리다이렉트
        return "redirect:content_view?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount()
                + "&bid=" + dto.getBid();
    }

    // 대댓글 삭제
    @RequestMapping("/rrdelete")
    public String rrelete(@ModelAttribute FBReply2DTO dto, @ModelAttribute("cri") FBCriteria cri,
                           RedirectAttributes rttr) {
        rreplyService.rrdelete(dto);
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

        return "redirect:content_view?pageNum=" + cri.getPageNum() + "&amount=" + cri.getAmount()
                + "&bid=" + dto.getBid();
    }
}
	
