package com.crmdemo.controller;

import com.crmdemo.entity.Areas;
import com.crmdemo.entity.Cities;
import com.crmdemo.service.AreasService;
import com.crmdemo.service.CitiesService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class JsonController {
    @Resource
    AreasService areasService;
    @Resource
    CitiesService citiesService;

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
}
