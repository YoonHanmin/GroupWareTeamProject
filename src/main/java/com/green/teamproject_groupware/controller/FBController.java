package com.green.teamproject_groupware.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.green.teamproject_groupware.dao.FBDao;
import com.green.teamproject_groupware.dto.FBDto;
import com.green.teamproject_groupware.service.FBService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class FBController {
	
	@Autowired
	private FBService service;

	@RequestMapping("/free_board_list")
	public String list(Model model) {
		log.info("@# free_board_list");
		
		ArrayList<FBDto> free_board_list = service.free_board_list();
		model.addAttribute("free_board_list", free_board_list);
				
		return "free_board_list";
	}
	
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
		
		FBDto dto = service.contentView(param);
		model.addAttribute("content_view", dto);
		
		service.increaseHit(param);
		
		return "content_view";
	}
	
	@RequestMapping("/modify")
	public String modify(@RequestParam HashMap<String, String> param) {
		log.info("@# modify");
		
		service.modify(param);
		
		return "redirect:free_board_list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam HashMap<String, String> param) {
		log.info("@# delete");
		
		service.delete(param);
		
		return "redirect:free_board_list";
	}	
	
    private FBDao fbDao;

    public void writeBoard(FBDto board, MultipartFile file) throws IOException {
        // 이미지 데이터를 byte 배열로 변환
        byte[] imageData = file.getBytes();
        board.setImageData(imageData);
        
        // 게시글 정보와 이미지 데이터를 저장
//        fbDao.write(board);
    }	
    
}



//	@GetMapping("/uploadForm")
//	public void uploadForm() {
//		log.info("uploadForm~!!!");
//	}
//	
//	@PostMapping("/uploadFormAction")
//	public void uploadFormAction(MultipartFile[] uploadFile) {
//		String uploadFolder = "D:\\dev\\upload";
//		for (MultipartFile multipartFile : uploadFile) {
//			log.info("==================");
//			log.info("@# 업로드 되는 파일 이름>>>>>>" + multipartFile.getOriginalFilename());
//			log.info("@# 업로드 되는 파일 크기>>>>>>" + multipartFile.getSize());
//			
//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//			try {
//				multipartFile.transferTo(saveFile);		
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//
//	@GetMapping("/uploadJquery")
//	public void uploadJquery() {
//	//	log를 계속 찍어서 구간별로 봐야 오류를 수정하기가 좋음
//		log.info("uploadJquery~!!!");
//	}
//
//	@PostMapping("/uploadAjaxAction")
//	public void uploadAjaxPost(MultipartFile[] uploadFile) {
//		log.info("@# uploadAjaxPost >>>>");
//		
//		String uploadFolder = "D:\\dev\\upload";
//		
//		String uploadFolderPath =  getFolder();
////		"D:\\dev\\upload" + 년월일 폴더 이렇게 생성될 것
//		File uploadPath =  new File(uploadFolder, uploadFolderPath);
//		
//		log.info("@# uploadPath >>>>" + uploadPath);
//		
//		if (uploadPath.exists() == false) {
////			make yyyy/MM/dd folder
//			uploadPath.mkdirs();
//		}
//		
//		for (MultipartFile multipartFile : uploadFile) {
//			
//			log.info("==================");
//	//		getOriginalFilename : 업로드 되는 파일 이름
//			log.info("@# 업로드 되는 파일 이름>>>>>>" + multipartFile.getOriginalFilename());
//	//		getSize : 업로드 되는 파일 크기
//			log.info("@# 업로드 되는 파일 크기>>>>>>" + multipartFile.getSize());
//			
//			String uploadFileName = multipartFile.getOriginalFilename();
//			UUID uuid = UUID.randomUUID();
//			log.info("@# uuid>>>>>>" + uuid);
//			uploadFileName = uuid+"_"+uploadFileName;
//			
//	//		saveFile : 경로와 파일이름
//			File saveFile = new File(uploadPath, uploadFileName);	
//			
//			try {
//	//			transferTo : saveFile 내용을 저장
//				multipartFile.transferTo(saveFile);		
////				참이면 이미지 파일
//				if (checkImageType(saveFile)) {
////					썸네일 파일은 앞에 s_를 추가
//					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
////					썸네일 파일 형식을 100/100 크기로 생성
//					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
//					thumbnail.close();
//				}
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//	}
//
//	//날짜별 폴더생성
//	private String getFolder() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
//		String str = sdf.format(date);
//		
//		log.info("@# str >>>>" + str);
//		log.info("@# separator >>>>" + File.separator);
//		
//		return str.replace("-", File.separator); //여기까지 하고 위에 폴더쪽으로 가서 수정
//	}
//	
//	public boolean checkImageType(File file) {
//		try {
////			이미지 파일인지 체크하기 위한 타입(probeContentType)
//			String contentType = Files.probeContentType(file.toPath());
//			log.info("@# contentType>>>>" + contentType);
//			log.info("@# startsWith(\"image\")>>>>" + contentType.startsWith("image"));
//			
////			startsWith : 파일 종류를 판단하는 메소드
//			return contentType.startsWith("image"); //참이면 이미지 파일
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return false; //거짓이면 이미지 파일이 아님
//	}
//}



