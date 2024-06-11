package com.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController2 {

    @GetMapping("/animu/user")
    public String getMethodName(Model model) {
        return "/views/user";
    }

}
