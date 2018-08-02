package com.crmdemo.controller;

import com.crmdemo.entity.Customerservice;
import com.crmdemo.service.impl.CustomerserviceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CustomerserviceController {
    @Resource
    private CustomerserviceServiceImpl customerserviceServiceimpl;

    @ResponseBody
    @RequestMapping("/getCustomerservice")
    public List<Customerservice> getCustomerservice(String name) {
        List<Customerservice> customerservices = customerserviceServiceimpl.selectcustomerservice(name);
        return customerservices;//查询服务人员
    }

    @ResponseBody
    @RequestMapping("/insertCustomerservice")
    public boolean insertCustomerservice(String name) {
        boolean sf = false;
        List<Customerservice> customerservices = customerserviceServiceimpl.selectcustomerservice(null);
        for (Customerservice cu : customerservices) {
            if (cu.getName().equals(name)) {
                return sf;
            }
        }
        if (customerserviceServiceimpl.Insertcustomerservice(name) > 0) {
            sf = true;
        }
        return sf;
    }
    //删除客服
    @ResponseBody
    @RequestMapping("/delCustomerservice")
    public boolean delCustomerservice(String id) {
        boolean sf = false;
        if (customerserviceServiceimpl.delcustomerservice(id) > 0) {
            sf = true;
        }
        return sf;
    }
}
