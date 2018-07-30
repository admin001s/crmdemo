package com.crmdemo.controller;

import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrminfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
public class HomeController {
    @Resource
    CrminfoService crminfoService;

    @ResponseBody
    @RequestMapping("dologin.do")
    public Map<String,Object> dologin(Crminfo crminfo){
        Crminfo crminfo1=crminfoService.selectLogin(crminfo);
        Map<String,Object> map=new HashMap<String,Object>();
        if(null== crminfo1){
            map.put("is",false);
            map.put("tips","用户不存在！");
        }else {
            if(crminfo1.getUserId()==-1){
                map.put("is",false);
                map.put("tips","密码错误！");
            }else {
                map.put("is",true);
                map.put("tips","登录成功！");
            }
        }
        return  map;
    }
}
