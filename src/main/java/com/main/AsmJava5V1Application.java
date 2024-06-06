package com.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@ComponentScan(basePackages = {"com.main"})

@EnableJpaRepositories(basePackages = "com.main.repository")
//
@ComponentScans(value = {@ComponentScan("com.main.controller"), @ComponentScan("com.main.service")})
@EntityScan(basePackages = "com.main.model")
@EnableScheduling
public class AsmJava5V1Application {

	public static void main(String[] args) {
		SpringApplication.run(AsmJava5V1Application.class, args);
	}

}
