package com.crmdemo.controller;

import com.crmdemo.entity.*;
import com.crmdemo.service.*;
import com.crmdemo.util.CommonUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    @Resource
    AgencystaffService agencystaffService;

    /**
     * 获取城市
     *
     * @param provinceid
     * @return
     */
    @RequestMapping("getcities.do")
    public Object getcities(String provinceid) {
        Cities cities = new Cities();
        cities.setProvinceid(provinceid);
        return citiesService.selectCitiesList(cities);
    }

    /**
     * 获取地区
     *
     * @param cityid
     * @return
     */
    @RequestMapping("getareas.do")
    public Object getareas(String cityid) {
        Areas areas = new Areas();
        areas.setCityid(cityid);
        return areasService.selectAreasList(areas);
    }

    /**
     * 新增客户
     *
     * @param crmcustomersinfo
     * @return response
     */
    @RequestMapping("addCrmcustomersinfo.do")
    public Object addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo, HttpServletResponse response, HttpServletRequest request) {
        crmcustomersinfo.setAdduserId(CommonUtils.getUser(request, response).getUserId());
        crmcustomersinfo.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if (crmcustomersinfoService.addCrmcustomersinfo(crmcustomersinfo)) {
            return true;
        }
        return false;
    }

    /**
     * 新增代理商
     *
     * @param crmagentsinfo
     * @param response
     * @return
     */
    @RequestMapping("addCrmagentsinfo.do")
    public Object addCrmagentsinfo(Crmagentsinfo crmagentsinfo, Crminfo crminfo, HttpServletResponse response, HttpServletRequest request, String character) {
        crminfo.setRoleId(5);
        crminfo.setUserId(crminfoService.selectMaxId() + 1);
        crminfo.setUserArrangement(character + "/" + crminfo.getUserId());
        crminfo.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if (crminfoService.insertCrminfo(crminfo)) {
            crmagentsinfo.setAddCreateTime(new Timestamp(System.currentTimeMillis()));
            crmagentsinfo.setAgentRelationship(character);
            String[] strs = character.split("/");
            crmagentsinfo.setReviewerId(Integer.parseInt(strs[strs.length - 1]));
            crmagentsinfo.setAgentCharacterrelationship(crminfo.getUserArrangement());
            crmagentsinfo.setIsdelete(0);
            if (crmagentsinfoService.insertCrmagentsinfo(crmagentsinfo)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 查询代理商信息
     *
     * @param crmagentsinfo
     * @param response
     * @return
     */
    @RequestMapping("getAgentList.do")
    public Object getAgentList(Crmagentsinfo crmagentsinfo, HttpServletResponse response, HttpServletRequest request) {
        crmagentsinfo.setAgentRelationship(CommonUtils.getUser(request, response).getUserArrangement());
        return crmagentsinfoService.selectCrmagentsinfoList(crmagentsinfo);
    }

    /**
     * 获取客户信息
     *
     * @param crmcustomersinfo
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("getCustomersList.do")
    public Object getCustomersList(Crmcustomersinfo crmcustomersinfo, HttpServletResponse response, HttpServletRequest request) {
        crmcustomersinfo.setAdduserId(CommonUtils.getUser(request, response).getUserId());
        return crmcustomersinfoService.selectCrmcustomersinfoList(crmcustomersinfo);
    }

    /**
     * 查询渠道部信息
     *
     * @param crminfo
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("getCusinfo.do")
    public Object getCusinfo(Crminfo crminfo, HttpServletResponse response, HttpServletRequest request) {
        if (crminfo.getUserArrangement() == null) {
            crminfo.setUserArrangement(CommonUtils.getUser(request, response).getUserArrangement());
        }
        return crminfoService.selectCrminfoList(crminfo);
    }

    /**
     * 检查代理商关键信息是否重复
     *
     * @param crmagentsinfo
     * @return
     */
    @RequestMapping("isrepeat.do")
    public Object isrepeat(Crmagentsinfo crmagentsinfo) {
        return crmagentsinfoService.isrepeat(crmagentsinfo);
    }

    /**
     * 检查账号是否重复
     *
     * @param crminfo
     * @return
     */
    @RequestMapping("isUserRepeat.do")
    public Object isUserRepeat(Crminfo crminfo) {
        return crminfoService.isrepeat(crminfo);
    }

    /**
     * 修改代理商信息
     *
     * @param crmagentsinfo
     * @return
     */
    @RequestMapping("updateAgents.do")
    public Object updateAgents(Crmagentsinfo crmagentsinfo) {
        if (crmagentsinfoService.updateCrmcustomersinfo(crmagentsinfo)) {
            return true;
        }
        return false;
    }

    /**
     * 删除代理商
     *
     * @param crmagentsinfo
     * @return
     */
    @RequestMapping("delAgents.do")
    public Object delAgents(Crmagentsinfo crmagentsinfo) {
        if (crmagentsinfoService.deleteCrmcustomersinfo(crmagentsinfo)) {
            return true;
        }
        return false;
    }

    /**
     * 获取代理员工的信息
     *
     * @param agencystaff
     * @return
     */
    @RequestMapping("getAgencystaffList.do")
    public Object getAgencystaffList(Agencystaff agencystaff,HttpServletResponse response,HttpServletRequest request) {
        agencystaff.setAgentStaffCharacterrelationship(CommonUtils.getUser(request,response).getUserArrangement());
        return agencystaffService.selectAgencystaffList(agencystaff);
    }

    /**
     * 检查代理商员工关键信息是否重复
     *
     * @param agencystaff
     * @return
     */
    @RequestMapping("isAgencystaffrepeat.do")
    public Object isagencystaffrepeat(Agencystaff agencystaff) {
        return agencystaffService.isrepeat(agencystaff);
    }

    /**
     * 添加代理商员工
     *
     * @param agencystaff
     * @param crminfo
     * @return
     */
    @RequestMapping("addAgencystaff.do")
    public Object addAgencystaff(Agencystaff agencystaff, Crminfo crminfo, HttpServletRequest request, HttpServletResponse response) {
        if (CommonUtils.getUser(request, response).getRoleId() == 5) {
            crminfo.setRoleId(6);
            crminfo.setUserId(crminfoService.selectMaxId() + 1);
            crminfo.setUserArrangement(CommonUtils.getUser(request, response).getUserArrangement() + "/" + crminfo.getUserId());
            crminfo.setCreateTime(new Timestamp(System.currentTimeMillis()));
            if (crminfoService.insertCrminfo(crminfo)) {
                agencystaff.setAddCreateTime(new Timestamp(System.currentTimeMillis()));
                String[] strs = CommonUtils.getUser(request, response).getUserArrangement().split("/");
                agencystaff.setAgentStaffParentid(Integer.parseInt(strs[strs.length - 1]));
                agencystaff.setAgentStaffCharacterrelationship(crminfo.getUserArrangement());
                agencystaff.setIsdelete(0);
                if(agencystaffService.insertAgencystaff(agencystaff)){
                    return  true;
                }
            }
        }
        return false;
    }

    /**
     * 修改代理商员工信息
     * @param agencystaff
     * @return
     */
    @RequestMapping("updateAgencystaff.do")
    public Object updateAgencystaff(Agencystaff agencystaff){
        return agencystaffService.updateAgencystaff(agencystaff);
    }

    @RequestMapping("deleteAgencystaff.do")
    public Object deleteAgencystaff(Agencystaff agencystaff){
        return agencystaffService.deleteAgencystaff(agencystaff);
    }
}
