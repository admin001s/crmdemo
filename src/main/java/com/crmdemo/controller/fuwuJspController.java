package com.crmdemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class fuwuJspController {
    //开通服务
    @RequestMapping("/OpenList.do")
    public String index(){
        return  "service/OpenList";
    }
















}
