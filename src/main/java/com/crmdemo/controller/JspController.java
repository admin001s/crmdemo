package com.crmdemo.controller;

import com.crmdemo.service.ProvincesService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class JspController {
    @Resource
    ProvincesService provincesService;

    /**
     * 登录页面
     * @return
     */
    @RequestMapping("index.do")
    public String index(){
        return  "login";
    }

    /**
     * 首页
     * @return
     */
    @RequestMapping("doindex.do")
    public String doindex(){
        return "index";
    }

    /**
     * 客户管理页面
     * @return
     */
    @RequestMapping("customer.do")
    public String customer(){
        return "crm/customer";
    }

    /**
     * 添加客户页面
     * @return
     */
    @RequestMapping("addcustomer.do")
    public String addcustomer(ModelMap modelMap){
        modelMap.put("provinces",provincesService.selectProList());
        return "crm/customer_add";
    }
}
