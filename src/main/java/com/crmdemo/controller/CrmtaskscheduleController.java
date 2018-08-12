package com.crmdemo.controller;

import com.crmdemo.entity.Crminfo;
import com.crmdemo.entity.Crmtaskschedule;
import com.crmdemo.entity.Customerservice;
import com.crmdemo.service.impl.CrmproductserviceServiceImpl;
import com.crmdemo.service.impl.CrmtaskscheduleServiceImpl;
import com.crmdemo.util.DateUtil;
import com.crmdemo.vop.Crmtaskschedulevop;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class CrmtaskscheduleController {
    @Resource
    private CrmtaskscheduleServiceImpl crmtaskscheduleService;

    //查询
    @ResponseBody
    @RequestMapping("/getCrmtaskschedulevop.do")
    public List<Crmtaskschedulevop> getCrmtaskschedulevop() {
        List<Crmtaskschedulevop> crmtaskschedulevops =crmtaskscheduleService.selectCrmtaskschedulevop();
        if(crmtaskschedulevops.size()==0){
            return null;
        }
        for (Crmtaskschedulevop crm:crmtaskschedulevops){
            if(crm.getConfirmTime()!=null){
                crm.setConfirmTime(java.sql.Date.valueOf(DateUtil.getDateTime_I(crm.getConfirmTime())));
            }
            if(crm.getServiceTime()!=null){
                crm.setServiceTime(java.sql.Date.valueOf(DateUtil.getDateTime_I(crm.getServiceTime())));
            }

        }
        return crmtaskschedulevops;
    }

    //插入任务
    @ResponseBody
    @RequestMapping("/addCrmtaskschedule.do")
    public boolean addCrmtaskschedule(Crmtaskschedule crmtaskschedule) {
        boolean sf=false;
        crmtaskschedule.setCreateTime(new Date());
        crmtaskschedule.setStatus(0);
        int i =crmtaskscheduleService.addCrmtaskschedule(crmtaskschedule);
        if(i>0){
            sf=true;
        }
        return sf;
    }

    //更新任务
    @ResponseBody
    @RequestMapping("/updateCrmtaskschedule.do")
    public boolean updateCrmtaskschedule(Crmtaskschedule crmtaskschedule, HttpSession session) {
        boolean sf=false;
        crmtaskschedule.setUpdateTime(new Date());
        crmtaskschedule.setConfirmTime(new Date());
        crmtaskschedule.setStatus(1);
        Crminfo crminfo= (Crminfo) session.getAttribute("user");
        crmtaskschedule.setConfirmUserId(crminfo.getUserId());
        int i =crmtaskscheduleService.updateCrmtaskschedule(crmtaskschedule);
        if(i>0){
            sf=true;
        }
        return sf;
    }
}
