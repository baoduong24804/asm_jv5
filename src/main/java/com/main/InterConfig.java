package com.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.main.interceptor.AuthInterceptor;
import com.main.interceptor.GlobalInterceptor;
import com.main.interceptor.MemberInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	GlobalInterceptor global;

	@Autowired
	AuthInterceptor auth;

	@Autowired
	MemberInterceptor member;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		
		//registry.addInterceptor(global).addPathPatterns("/**").excludePathPatterns("");

		//registry.addInterceptor(auth).addPathPatterns("/animu/control").excludePathPatterns("");

		//registry.addInterceptor(member).addPathPatterns("/animu/home").excludePathPatterns("");
	}
}
