package com.crmdemo.controller;

import com.crmdemo.entity.*;
import com.crmdemo.service.*;
import com.crmdemo.util.CommonUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

@RestController
public class JsonController {
    @Resource
    AreasService areasService;
    @Resource
    CitiesService citiesService;
    @Resource
    CrmcustomersinfoService crmcustomersinfoService;
    @Resource
    CrmagentsinfoService crmagentsinfoService;
    @Resource
    CrminfoService crminfoService;

    /**
     * 获取城市
     * @param provinceid
     * @return
     */
    @RequestMapping("getcities.do")
    public Object getcities(String provinceid){
        Cities cities=new Cities();
        cities.setProvinceid(provinceid);
        return citiesService.selectCitiesList(cities);
    }

    /**
     * 获取地区
     * @param cityid
     * @return
     */
    @RequestMapping("getareas.do")
    public Object getareas(String cityid){
        Areas areas=new Areas();
        areas.setCityid(cityid);
        return areasService.selectAreasList(areas);
    }

    /**
     * 新增客户
     * @param crmcustomersinfo
     * @return response
     */
    @RequestMapping("addCrmcustomersinfo.do")
    public Object addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo, HttpServletResponse response, HttpServletRequest request){
        crmcustomersinfo.setAdduserId(CommonUtils.getUser(request,response).getUserId());
        crmcustomersinfo.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if(crmcustomersinfoService.addCrmcustomersinfo(crmcustomersinfo)){
            return  true;
        }
        return  false;
    }

    /**
     * 新增代理商
     * @param crmagentsinfo
     * @param response
     * @return
     */
    @RequestMapping("addCrmagentsinfo.do")
    public Object addCrmagentsinfo(Crmagentsinfo crmagentsinfo, HttpServletResponse response, HttpServletRequest request){
        crmagentsinfo.setReviewerId(CommonUtils.getUser(request,response).getUserId());
        crmagentsinfo.setAddCreateTime(new Timestamp(System.currentTimeMillis()));
        if(crmagentsinfoService.insertCrmagentsinfo(crmagentsinfo)){
            return  true;
        }
        return  false;
    }

    /**
     * 查询代理商信息
     * @param crmagentsinfo
     * @param response
     * @return
     */
    @RequestMapping("getAgentList.do")
    public Object getAgentList(Crmagentsinfo crmagentsinfo, HttpServletResponse response, HttpServletRequest request){
        crmagentsinfo.setReviewerId(CommonUtils.getUser(request,response).getUserId());
        return crmagentsinfoService.selectCrmagentsinfoList(crmagentsinfo);
    }

    @RequestMapping("getCustomersList.do")
    public Object getCustomersList(Crmcustomersinfo crmcustomersinfo, HttpServletResponse response, HttpServletRequest request){
        crmcustomersinfo.setAdduserId(CommonUtils.getUser(request,response).getUserId());
        return crmcustomersinfoService.selectCrmcustomersinfoList(crmcustomersinfo);
    }

    @RequestMapping("getCusinfo.do")
    public Object getCusinfo(Crminfo crminfo, HttpServletResponse response, HttpServletRequest request){
        if(crminfo.getUserArrangement()==null){
            crminfo.setUserArrangement(CommonUtils.getUser(request,response).getUserArrangement());
        }
        return crminfoService.selectCrminfoList(crminfo);
    }
}
