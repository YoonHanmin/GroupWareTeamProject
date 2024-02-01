package com.green.teamproject_groupware.dao;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.fasterxml.jackson.databind.deser.std.CollectionDeserializer.CollectionReferringAccumulator;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Repository
@NoArgsConstructor
@Slf4j
public class EmitterrepositoryImpl implements EmitterRepository{

	private final Map<String, SseEmitter> emitters = new ConcurrentHashMap<>();
    private final Map<String, Object> eventCache = new ConcurrentHashMap<>();
	
	@Override
	public SseEmitter save(String emitterId, SseEmitter sseEmitter) {
		emitters.putIfAbsent(emitterId, sseEmitter);
		log.info(""+emitters);
		return sseEmitter;
	}

	@Override
	public void saveEventCache(String eventCacheId, Object event) {
		eventCache.put(eventCacheId, event);
		
	}
	@Override
	public Map<String, SseEmitter> findAllEmitterStartWithById(String id) {
		
		return emitters.entrySet().stream().filter(entry -> entry.getKey().startsWith(id))
				.collect(Collectors.toMap(Map.Entry::getKey,Map.Entry::getValue));
	}
	@Override
	public Map<String, Object> findAllEventCacheStartWithById(String id) {
		 return emitters.entrySet().stream()
	                .filter(entry -> entry.getKey().startsWith(id))
	                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	}

	@Override
	public void deleteById(String id) {
		emitters.remove(id);
	}

	@Override
	public void deleteAllEmitterStartWithId(String id) {
		 emitters.forEach((key, emitter) -> {
	            if (key.startsWith(id)){
	                emitters.remove(key);
	            }
	        });
		
	}

	@Override
	public void deleteAllEventCacheStartWithId(String id) {
		emitters.forEach((key, emitter) -> {
            if (key.startsWith(id)){
                emitters.remove(key);
            }
        });
    }
		
	}

	
	
	


