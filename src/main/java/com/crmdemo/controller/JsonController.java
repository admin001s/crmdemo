package com.crmdemo.controller;

import com.crmdemo.entity.Areas;
import com.crmdemo.entity.Cities;
import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.service.AreasService;
import com.crmdemo.service.CitiesService;
import com.crmdemo.service.CrmagentsinfoService;
import com.crmdemo.service.CrmcustomersinfoService;
import com.crmdemo.util.CommonUtils;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
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
     * @return
     */
    @RequestMapping("addCrmcustomersinfo.do")
    public Object addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo, HttpSession session){
        crmcustomersinfo.setAdduserId(CommonUtils.getUser(session).getUserId());
        crmcustomersinfo.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if(crmcustomersinfoService.addCrmcustomersinfo(crmcustomersinfo)){
            return  true;
        }
        return  false;
    }

    /**
     * 新增代理商
     * @param crmagentsinfo
     * @param session
     * @return
     */
    @RequestMapping("addCrmagentsinfo.do")
    public Object addCrmagentsinfo(Crmagentsinfo crmagentsinfo,HttpSession session){
        crmagentsinfo.setReviewerId(CommonUtils.getUser(session).getUserId());
        crmagentsinfo.setAddCreateTime(new Timestamp(System.currentTimeMillis()));
        if(crmagentsinfoService.insertCrmagentsinfo(crmagentsinfo)){
            return  true;
        }
        return  false;
    }

    /**
     * 查询代理商信息
     * @param crmagentsinfo
     * @param session
     * @return
     */
    @RequestMapping("getAgentList.do")
    public Object getAgentList(Crmagentsinfo crmagentsinfo,HttpSession session){
        crmagentsinfo.setReviewerId(CommonUtils.getUser(session).getUserId());
        return crmagentsinfoService.selectCrmagentsinfoList(crmagentsinfo);
    }
}
