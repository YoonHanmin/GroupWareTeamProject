package com.green.teamproject_groupware.controller;

import java.util.HashMap;

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
        model.addAttribute("prlist", preplyService.prlist());
        return "preply_list";  // 뷰 이름
    }
    
    @GetMapping("/prwrite")
    public String prwrite(@RequestParam("pid") int pid, Model model) {
        model.addAttribute("pid", pid);
        return "preply_write";  // 뷰 이름
    }

    @RequestMapping(value = "/prwrite", method = RequestMethod.POST)
    public String prwrite(@RequestBody HashMap<String, String> param) {
        // Create DTO and set values
        PBReplyDTO dto = new PBReplyDTO();
        dto.setPid(Integer.parseInt(param.get("pid")));
        dto.setPrwriter(param.get("prwriter"));
        dto.setPrcontent(param.get("prcontent"));

        // 댓글 작성
        preplyService.prwrite(param);
        
        // 댓글 목록 페이지로 리다이렉트
        return "redirect:/preply/prlist?pid=" + dto.getPid();
    }

    @PutMapping("/prmodify")
    public String prmodify(@RequestBody HashMap<String, String> param) {
        preplyService.prmodify(param);
        return "redirect:/preply/prlist?pid=" + param.get("pid");
    }

    @DeleteMapping("/prdelete")
    public String prdelete(@RequestBody HashMap<String, String> param) {
        preplyService.prdelete(param);
        return "redirect:/preply/prlist?pid=" + param.get("pid");
    }
}