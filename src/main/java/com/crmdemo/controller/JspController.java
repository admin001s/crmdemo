package com.crmdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {
    @RequestMapping("login.do")
    public String login(){
        return  "login";
    }

    @RequestMapping("index.do")
    public String index(){
        return  "index";
    }
}
