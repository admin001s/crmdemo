package com.crmdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {
    @RequestMapping("index.do")
    public String index(){
        return  "login";
    }
    @RequestMapping("doindex.do")
    public String doindex(){
        return "index";
    }
}
