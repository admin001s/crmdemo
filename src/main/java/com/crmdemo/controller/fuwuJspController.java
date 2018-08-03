package com.crmdemo.controller;

import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.service.impl.CrmproductserviceServiceImpl;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class fuwuJspController {
    @Resource
    private CrmproductserviceServiceImpl crmproductserviceService;
    //服务
    @RequestMapping("/OpenList.do")
    public String index(HttpServletRequest request){
//        Map<String,Object> map=new HashMap<String,Object>();
        List<Crmproductservice> crmproductserviceList=crmproductserviceService.selectCrmproductservice();
        request.setAttribute("crmproductserviceList",crmproductserviceList);
//        map.put("crmproductserviceList",crmproductserviceList);
        return  "service/OpenList";
    }
















}
