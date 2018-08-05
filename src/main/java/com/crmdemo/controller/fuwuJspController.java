package com.crmdemo.controller;

import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.entity.Customerservice;
import com.crmdemo.service.impl.CrmproductserviceServiceImpl;
import com.crmdemo.service.impl.CustomerserviceServiceImpl;
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
    @Resource
    private CustomerserviceServiceImpl customerserviceServiceimpl;

    //服务
    @RequestMapping("/OpenList.do")
    public String index(HttpServletRequest request) {
        List<Crmproductservice> crmproductserviceList = crmproductserviceService.selectCrmproductservice(null);
        request.setAttribute("crmproductserviceList", crmproductserviceList);
        return "service/OpenList";
    }

    //分配
    @RequestMapping("/AllocationOneLlist.do")
    public String AllocationOneLlist() {
        return "service/AllocationOneLlist";
    }

    //产品服务线
    @RequestMapping("/servicelist.do")
    public String servicelist() {
        return "service/servicelist";
    }

    //模块
    @RequestMapping("/modularlist.do")
    public String modularlist(HttpServletRequest request) {
        List<Crmproductservice> crmproductserviceList = crmproductserviceService.selectCrmproductservice(null);
        request.setAttribute("crmproductList", crmproductserviceList);
        return "service/modularlist";
    }

}