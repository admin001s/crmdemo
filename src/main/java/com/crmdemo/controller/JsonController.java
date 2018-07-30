package com.crmdemo.controller;

import com.crmdemo.entity.Areas;
import com.crmdemo.entity.Cities;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.service.AreasService;
import com.crmdemo.service.CitiesService;
import com.crmdemo.service.CrmcustomersinfoService;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class JsonController {
    @Resource
    AreasService areasService;
    @Resource
    CitiesService citiesService;
    @Resource
    CrmcustomersinfoService crmcustomersinfoService;

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
    public Object addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo){
        if(crmcustomersinfoService.addCrmcustomersinfo(crmcustomersinfo)){
            return  true;
        }
        return  false;
    }
}
