package com.crmdemo.controller;

import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.entity.Customerservice;
import com.crmdemo.service.impl.CrmcustomersinfoServiceImpl;
import com.crmdemo.service.impl.CrmproductserviceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Controller
public class CrmproductserviceController {
    @Resource
    private CrmproductserviceServiceImpl crmproductserviceService;


    //查询产品
    @ResponseBody
    @RequestMapping("/getCustomerservicelist.do")
    public List<Crmproductservice> getCustomerservicelist(@RequestParam(value = "id",required = false) String id) {
        List<Crmproductservice> crmproductserviceList = crmproductserviceService.selectCrmproductservice(id);
        return crmproductserviceList;
    }

    //添加产品
    @ResponseBody
    @RequestMapping("/addCustomerservicelist.do")
    public boolean addCustomerservicelist(Crmproductservice crmproductservice) {
        boolean sf=false;
        List<Crmproductservice> crmproductserviceList = crmproductserviceService.selectCrmproductservice(null);
        if(crmproductserviceList.size()==0){
            crmproductservice.setCreateTime(new Date());
            crmproductserviceService.addCrmproductservice(crmproductservice);
            return true;
        }
        for (Crmproductservice crm:crmproductserviceList){
            if(!crm.getName().equals(crmproductservice.getName())){
                int i=0;
                crmproductservice.setCreateTime(new Date());
                i=crmproductserviceService.addCrmproductservice(crmproductservice);
                if(i>0){
                    sf=true;
                    return sf;
                }
            }
        }
        return sf;
    }

    //修改产品
    @ResponseBody
    @RequestMapping("/updateCustomerservice.do")
    public boolean updateCustomerservice(Crmproductservice crmproductservice) {
        boolean sf=false;
        crmproductservice.setUpdateTime(new Date());
        int i = crmproductserviceService.updateCrmproductservice(crmproductservice);
        if (i>0){
            sf=true;
        }
        return sf;
    }

    //删除产品
    @ResponseBody
    @RequestMapping("/deleCustomerservice.do")
    public boolean deleCustomerservice(String id) {
        boolean sf=false;
        int i = crmproductserviceService.delCrmproductservice(id);
        if (i>0){
            sf=true;
        }
        return sf;
    }
}
