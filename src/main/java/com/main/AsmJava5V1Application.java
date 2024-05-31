package com.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan(basePackages = {"com.controller", "com.utils"})
@EnableJpaRepositories(basePackages = "com.repository")

@ComponentScans(value = {@ComponentScan("com.controller"), @ComponentScan("com.service"),@ComponentScan("com.utils")})
@EntityScan(basePackages = "com.model")
public class AsmJava5V1Application {

	public static void main(String[] args) {
		SpringApplication.run(AsmJava5V1Application.class, args);
	}

}
