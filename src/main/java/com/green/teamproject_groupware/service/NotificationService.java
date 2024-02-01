package com.green.teamproject_groupware.service;

import java.io.IOException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.green.teamproject_groupware.dao.EmitterrepositoryImpl;
import com.green.teamproject_groupware.dto.MsgDto;
import com.green.teamproject_groupware.dto.Notification;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class NotificationService {
	
	private static final Long DEFAULT_TIMEOUT = 60l * 1000 * 60;
	private final EmitterrepositoryImpl emitterRepository;
	
	public SseEmitter subscribe(String empno,String lastEventId) {
		String id = empno + "_"+ System.currentTimeMillis();
		SseEmitter emitter = emitterRepository.save(id, new SseEmitter(DEFAULT_TIMEOUT));
		
		// 오류시 emitter 제거
		emitter.onCompletion(()-> emitterRepository.deleteById(id));
		log.info("연결종료!!!! 객체 삭제함");
		emitter.onTimeout(() -> emitterRepository.deleteById(id));
		
		// 더미데이터 전송
		sendToclient(emitter,id,"EventStream 생성: [userID="+id+"]");
		
		if(!lastEventId.isEmpty()) {
			Map<String,Object> events = emitterRepository.findAllEventCacheStartWithById(String.valueOf(id));
			events.entrySet().stream()
			.filter(entry -> lastEventId.compareTo(entry.getKey())<0)
			.forEach(entry -> sendToclient(emitter,entry.getKey(),entry.getValue()));
			
		}
		return emitter;
	}
//	클라이언트에게 이벤트 발생시 emitter 보냄 
	public void sendEvent(String receiver,String notificationType,String msgTitle) {
		Notification notification = createNotification(receiver,notificationType,msgTitle);
		
		Map<String,SseEmitter> sseEmitters = emitterRepository.findAllEmitterStartWithById(receiver);
		sseEmitters.forEach(
				(key,emitter)->{
					emitterRepository.saveEventCache(key, notification);
					log.info("알림내용 ==>"+notification);
					//데이터 전송
					sendToclient(emitter, key, NotificationResponse.from(notification));
				}
				);
		
	}
	
//	Notification 객체 생성 메소드
	private Notification createNotification(String receiver,String notificationType,String msgTitle) {
		return Notification.builder()
				.receiver(receiver)
				.notificationType(notificationType)
				.msgTitle(msgTitle)
				.url("/connect/"+receiver) // 
				.isRead(false)
				.build();
	}
	
	private void sendToclient(SseEmitter emitter,String id,Object data) {
		try {
			emitter.send(SseEmitter.event()
									.id(id)
									.name("sse")
									.data(data));
			 log.info("알림내용 ==> " + data);
					
		} catch (IOException e) {
			emitterRepository.deleteById(id);
			throw new RuntimeException("연결오류");
		}
		
	}
	
}
