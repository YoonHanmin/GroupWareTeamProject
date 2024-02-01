package com.green.teamproject_groupware.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.green.teamproject_groupware.dto.PBReplyDTO;
import com.green.teamproject_groupware.service.PBReplyService;

@Controller
@RequestMapping("/preply")
public class PBReplyController {
    @Autowired
    private PBReplyService preplyService;

    @GetMapping("/prlist")
    public String prlist(@RequestParam("pid") int pid, Model model) {
        model.addAttribute("prlist", preplyService.prlist(pid));  // pid를 인자로 전달
        return "picture_content_view";  // 뷰 이름
    }
    
    @GetMapping("/prwrite")
    public String prwrite(@RequestParam("pid") int pid, Model model) {
        model.addAttribute("pid", pid);
        return "preply_write";  // 뷰 이름
    }

    @RequestMapping(value = "/prwrite", method = RequestMethod.POST)
    public String prwrite(@ModelAttribute PBReplyDTO dto) {  
        // 댓글 작성
        preplyService.prwrite(dto);

        // 댓글 목록 페이지로 리다이렉트
        return "redirect:/preply/prlist?pid=" + dto.getPid();
    }

    @PutMapping("/prmodify")
    public String prmodify(@RequestBody PBReplyDTO dto) {  // RequestBody를 통해 받은 param을 바로 dto로 사용
        preplyService.prmodify(dto);
        return "redirect:/preply/prlist?pid=" + dto.getPid();
    }

    @DeleteMapping("/prdelete")
    public String prdelete(@RequestBody PBReplyDTO dto) {  // RequestBody를 통해 받은 param을 바로 dto로 사용
        preplyService.prdelete(dto);
        return "redirect:/preply/prlist?pid=" + dto.getPid();
    }
}