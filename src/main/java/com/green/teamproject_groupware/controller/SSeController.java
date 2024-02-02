package com.green.teamproject_groupware.controller;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.green.teamproject_groupware.service.NotificationService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class SSeController {
	
	private final NotificationService notificationService;
	
	
	@GetMapping(value = "/connect/{empno}",produces = "text/event-stream")
	public SseEmitter connect(@PathVariable String empno,
			@RequestHeader(value="Last-Event-ID",required = false,defaultValue = "")String lastEventId){
	
		return notificationService.subscribe(empno, lastEventId);
	}
	
	
}
