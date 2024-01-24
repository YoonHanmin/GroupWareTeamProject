package com.green.teamproject_groupware.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmpController {

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
			File file = new File("D:\\dev\\ProjectUpload\\profile\\"+fileName);
			
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
	
		@PostMapping("/uploadFormAction")
		public void uploadFormPost(MultipartFile uploadFile,@RequestParam("name") String uploadFilename) {
			String uploadFolder = "D:\\dev\\ProjectUpload\\profile";
			
				log.info("====================");
//				getOriginalFilename : 업로드되는 파일 이름
				log.info("@# 보내는 이름===>"+uploadFilename);
				log.info("@# 업로드 되는 파일 이름 ==>"+uploadFile.getOriginalFilename());
//				getSize : 파일 크기
				log.info("@# 업로드 되는 파일 크기 ==>"+uploadFile.getSize());
//				File(저장경로,파일이름) 객체를 생성해서 saveFile로 받음.
				String filename = uploadFile.getOriginalFilename();
//				파일명에서 확장자 제거
				String[] parts = filename.split("\\.");
//				확장자 제거한 파일명
		        String oriname = parts[0];
//		        확장자
		        String ext = parts[1];
		       filename = uploadFilename+"."+ext;
		        
				File saveFile = new File(uploadFolder,filename);
				try{
//					transferTo : savaFile 내용을 저장
					uploadFile.transferTo(saveFile);
				}catch(IOException e) {
					e.printStackTrace();
				}
			
		}
		
		@PostMapping("/deleteFile")
		@ResponseBody
		public ResponseEntity<String> deleteFile(String fileName,String type){
			log.info("@# fileName,type ==> "+fileName,type);
			File file;
//			URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해서 디코딩
			try {
				file =new File("D:\\dev\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
				file.delete();
//				이미지 파일이면 썸네일도 삭제
				if(type.equals("image")) {
//					getAbsolutePath : 절대경로(full path)에서 s_ 제거
					String largeFileName = file.getAbsolutePath().replace("s_","");
					log.info("@# largeFileName ==>"+largeFileName);
					file =new File(URLDecoder.decode(largeFileName,"UTF-8"));
					file.delete();
				
				}
				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
//				예외 오류 발생시 404 not Found 처리
				return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
			}// ajax의 success function(result)의 result값으로 "deleted"가 전송됨
			return new ResponseEntity<String>("deleted",HttpStatus.OK);
		}
		
}
