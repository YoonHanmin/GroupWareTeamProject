package com.green.teamproject_groupware.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.green.teamproject_groupware.interceptor.SessionInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

	
	public void addInterceptor(InterceptorRegistry registry) {
		registry.addInterceptor(new SessionInterceptor())
		.addPathPatterns("/**") // 모든 경로에 대해서
		.excludePathPatterns("/login"); // 로그인페이지는 예외
	}
	
}
