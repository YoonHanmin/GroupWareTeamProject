package com.green.teamproject_groupware.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.teamproject_groupware.dto.EmpDto;
import com.green.teamproject_groupware.dto.PBCriteria;
import com.green.teamproject_groupware.dto.PBDto;
import com.green.teamproject_groupware.dto.PBPageDTO;
import com.green.teamproject_groupware.service.EmpService;
import com.green.teamproject_groupware.service.PBService;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Slf4j
public class PBController {
	
	@Autowired
	private PBService pservice;
	@Autowired
	private EmpService empservice;
	

	@RequestMapping("/picture_list_old")
	public String list(Model model) {
		log.info("@# list");
		
		ArrayList<PBDto> picture_list = pservice.picture_list();
		model.addAttribute("picture_list", picture_list);
				
		return "picture_list";
	}
	
	@RequestMapping("/picture_list")
	public String plist(HttpSession session, PBCriteria pcri, Model model) {
		log.info("@# plist");
		log.info("@# pcri===>"+ pcri);
		
		String empno = (String) session.getAttribute("empno");
		EmpDto dto = empservice.getEmpByEmpno(empno);
		model.addAttribute("dto", dto);
		
		model.addAttribute("picture_list", pservice.plist(pcri));
		int total = pservice.getTotalCount(pcri);
		model.addAttribute("pageMaker", new PBPageDTO(total, pcri));
		
		
		return "community/pictureboard";
	}
	
	@RequestMapping("/pwrite")
	public String pwrite(@RequestParam HashMap<String, String> param, @RequestParam("uploadFile") MultipartFile[] uploadFiles) {
	    // 파일 업로드 처리
	    String uploadPath = "D:\\dev\\upload";
	    
	    for (MultipartFile uploadFile : uploadFiles) {
	        String filename = uploadFile.getOriginalFilename();
	        String savePath = uploadPath + File.separator + filename;
	        
	        try {
	            // 파일 저장
	            File saveFile = new File(savePath);
	            uploadFile.transferTo(saveFile);
	            
	            // 파일 정보 DB에 저장
	            HashMap<String, String> fileData = new HashMap<>();
	            fileData.put("pname", new String(param.get("pname").getBytes("ISO-8859-1"), "UTF-8"));
	            fileData.put("ptitle", new String(param.get("ptitle").getBytes("ISO-8859-1"), "UTF-8"));
	            fileData.put("pcontent", new String(param.get("pcontent").getBytes("ISO-8859-1"), "UTF-8"));
	            fileData.put("filename", filename);
	            fileData.put("uploadpath", savePath);
	            
	            pservice.pwrite(fileData); // DB에 파일 정보 저장
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return "redirect:picture_list";
	}
	
	@RequestMapping("/picture_write_view")
	public String picture_write_view() {
		 
		return "picture_write_view";
	}
	
	@RequestMapping("/picture_content_view")
	public String picture_content_view(@RequestParam HashMap<String, String> param, Model model) {
		
		PBDto picturedto = pservice.pcontentView(param);
		model.addAttribute("pcontent_view", picturedto);
		model.addAttribute("pageMaker", param);
		
		pservice.pincreaseHit(param);
		
		return "picture_content_view";
	}
	
	@RequestMapping("/pmodify")
	public String pmodify(@RequestParam HashMap<String, String> param, @ModelAttribute("pcri") PBCriteria pcri, @RequestParam("uploadFile") MultipartFile uploadFile, RedirectAttributes rttr) {
	    // 새로운 이미지 파일이 있을 경우 파일 저장과 DB 업데이트
	    if (!uploadFile.isEmpty()) {
	        String filename = uploadFile.getOriginalFilename();
	        String uploadPath = "D:\\dev\\upload";
	        String savePath = uploadPath + File.separator + filename;
	        
	        try {
	            // 파일 저장
	            File saveFile = new File(savePath);
	            uploadFile.transferTo(saveFile);
	            
	            // DB에 파일 정보 업데이트
	            param.put("filename", filename);
	            param.put("uploadpath", savePath);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    try {
	        param.put("pname", new String(param.get("pname").getBytes("ISO-8859-1"), "UTF-8"));
	        param.put("ptitle", new String(param.get("ptitle").getBytes("ISO-8859-1"), "UTF-8"));
	        param.put("pcontent", new String(param.get("pcontent").getBytes("ISO-8859-1"), "UTF-8"));
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
	    
	    pservice.pmodify(param);
	    rttr.addAttribute("ppageNum", pcri.getPpageNum());
	    rttr.addAttribute("pamount", pcri.getPamount());
	    
	    return "redirect:picture_list";
	}
	
	@RequestMapping("/pdelete")
	public String pdelete(@RequestParam HashMap<String, String> param, @ModelAttribute("pcri") PBCriteria pcri, RedirectAttributes rttr) {
		pservice.pdelete(param);
		rttr.addAttribute("ppageNum", pcri.getPpageNum());
		rttr.addAttribute("pamount", pcri.getPamount());
		
		return "redirect:picture_list";
	}
	
	@GetMapping("/display2")
	public ResponseEntity<byte[]> displayFile(String fileName) throws IOException {
	    File file = new File("D:/dev/upload/" + fileName);

	    if (!file.exists() || !file.isFile()) {
	        throw new FileNotFoundException("The file does not exist: " + file.getAbsolutePath());
	    }

	    // 이미지 크기 조정
	    BufferedImage originalImage = ImageIO.read(file);
	    BufferedImage resizedImage = Thumbnails.of(originalImage)
	            .size(720, 540)
	            .asBufferedImage();

	    // 바이트 배열로 변환
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    ImageIO.write(resizedImage, "png", baos);
	    byte[] bytes = baos.toByteArray();

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_PNG);

	    return new ResponseEntity<>(bytes, headers, HttpStatus.OK);
	}

}
	
