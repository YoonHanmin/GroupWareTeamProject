package com.green.teamproject_groupware.controller;

import java.io.File;
import java.io.IOException;

import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.teamproject_groupware.dto.MemDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProfileController {

	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	// 이미지 파일을 받아서 화면에 출력(byte[] 타입)
		@GetMapping("/display")
		@ResponseBody
		public ResponseEntity<byte[]> getFile(String fileName){
			log.info("@# fileName ===>"+fileName);
//			업로드 파일 경로 + 이름
			File file = new File("D:\\images\\"+fileName);
			
			log.info("@# file ==>"+file);
			ResponseEntity<byte[]> result = null;
			HttpHeaders header = new HttpHeaders();
			try {
//			HttpHeaders 객체 생성후 add(컨텐츠타입,경로)메소드로 파일타입을 HTTP 헤더에 추가
				header.add("Content-Type", Files.probeContentType(file.toPath()));
//				파일 정보를 byte 배열로 복사+헤더정보+http상태 정상을 결과에 저장
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			return result;
		}
	
}
