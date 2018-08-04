package com.crmdemo.controller;

import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.service.CrmcustomersinfoService;
import com.crmdemo.service.impl.CrmcustomersinfoServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CrmcustomersinfoController {
    @Resource
    private CrmcustomersinfoServiceImpl crmcustomersinfoServiceimpl;

    //查询客户
    @ResponseBody
    @RequestMapping(value = "/getcrmcustomersinfo")
    public List<Crmcustomersinfo> getcrmcustomersinfo(@RequestParam(value = "open",required = false) String open){
        List<Crmcustomersinfo> crmcustomersinfoList=crmcustomersinfoServiceimpl.selectcrmcustomersinfo(open);
        return crmcustomersinfoList;
    }

}
