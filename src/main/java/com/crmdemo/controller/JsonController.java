package com.crmdemo.controller;

import com.crmdemo.entity.*;
import com.crmdemo.service.*;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.util.DateUtil;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;

import org.apache.commons.io.FilenameUtils;

import java.util.Map;

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
    @Resource
    CrmcustomerallocateService crmcustomerallocateService;
    @Resource
    CrmcustomerdetailsService crmcustomerdetailsService;

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
    public Object addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo, HttpServletResponse response, HttpServletRequest request, String fp) {
        Crminfo crminfo = CommonUtils.getUser(request, response);
        crmcustomersinfo.setAdduserId(crminfo.getUserId());
        crmcustomersinfo.setDeleteStatus(0);
        crmcustomersinfo.setCreateTime(new Timestamp(System.currentTimeMillis()));
        crmcustomersinfo.setAdduserHierarchy(crminfo.getUserArrangement());
        if (fp != null && !fp.equals("")) {
            crmcustomersinfo.setCustomerStatus(2);
        } else {
            crmcustomersinfo.setCustomerStatus(1);
        }
        if (crmcustomersinfoService.addCrmcustomersinfo(crmcustomersinfo)) {
            if (fp != null && !fp.equals("")) {
                Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
                crmcustomerallocate.setUserId(crminfo.getUserId());
                String[] str = fp.split("/");
                crmcustomerallocate.setBeiuserId(Integer.parseInt(str[str.length - 1]));
                crmcustomerallocate.setDistributionTime(new Timestamp(System.currentTimeMillis()));
                crmcustomerallocate.setCreateTime(new Timestamp(System.currentTimeMillis()));
                crmcustomerallocate.setCustomerId(crmcustomersinfo.getId());
                crmcustomerallocate.setIsRelation(0);
                if (crmcustomerallocateService.insertCrmcustomerallocate(crmcustomerallocate)) {
                    return true;
                }
            }
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
        crmcustomersinfo.setAdduserHierarchy(CommonUtils.getUser(request, response).getUserArrangement());
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
    public Object getAgencystaffList(Agencystaff agencystaff, HttpServletResponse response, HttpServletRequest request) {
        agencystaff.setAgentStaffCharacterrelationship(CommonUtils.getUser(request, response).getUserArrangement());
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
        if (CommonUtils.getUser(request, response).getRoleId() == 5 || CommonUtils.getUser(request, response).getRoleId() == 1) {
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
                if (agencystaffService.insertAgencystaff(agencystaff)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 修改代理商员工信息
     *
     * @param agencystaff
     * @return
     */
    @RequestMapping("updateAgencystaff.do")
    public Object updateAgencystaff(Agencystaff agencystaff) {
        return agencystaffService.updateAgencystaff(agencystaff);
    }

    /**
     * 删除代理商信息
     *
     * @param agencystaff
     * @return
     */
    @RequestMapping("deleteAgencystaff.do")
    public Object deleteAgencystaff(Agencystaff agencystaff) {
        return agencystaffService.deleteAgencystaff(agencystaff);
    }

    /**
     * 判断客户关键信息是否重复
     *
     * @param crmcustomersinfo
     * @return
     */
    @RequestMapping("isCustomerffrepeat.do")
    public Object isCustomerffrepeat(Crmcustomersinfo crmcustomersinfo) {
        return crmcustomersinfoService.isrepeat(crmcustomersinfo);
    }

    /**
     * 添加分配人
     *
     * @param beiuserId
     * @param customerId
     * @return
     */
    @RequestMapping("addFp.do")
    public Object addFp(String beiuserId, String customerId, HttpServletRequest request, HttpServletResponse response) {
        Crminfo crminfo = CommonUtils.getUser(request, response);
        Crmcustomersinfo crmcustomersinfo = new Crmcustomersinfo();
        crmcustomersinfo.setId(Integer.parseInt(customerId));
        crmcustomersinfo.setCustomerStatus(2);
        Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
        crmcustomerallocate.setUserId(crminfo.getUserId());
        String[] str = beiuserId.split("/");
        crmcustomerallocate.setBeiuserId(Integer.parseInt(str[str.length - 1]));
        crmcustomerallocate.setCreateTime(new Timestamp(System.currentTimeMillis()));
        crmcustomerallocate.setDistributionTime(new Timestamp(System.currentTimeMillis()));
        crmcustomerallocate.setCustomerId(Integer.parseInt(customerId));
        crmcustomerallocate.setIsRelation(0);
        if (crmcustomersinfoService.updateCrmcustomersinfo(crmcustomersinfo, crmcustomerallocate)) {
            return true;
        }
        return false;
    }

    /**
     * 新增跟进记录
     * @param response
     * @param crmcustomerdetails
     * @param bindingResult
     * @param test
     * @param request
     * @param createData
     * @return
     */
    @RequestMapping("uploadRecord.do")
    public Object uploadRecord(HttpServletResponse response, Crmcustomerdetails crmcustomerdetails, BindingResult bindingResult, MultipartFile[] test, HttpServletRequest request, String createData) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (bindingResult.hasErrors()) {
            map.put("error", "上传失败！");
            return map;
        }
        StringBuffer idPicPath = new StringBuffer();
        String path = request.getSession().getServletContext().getRealPath("static" + File.separator + "uploadfiles");
        for (int i = 0; i < test.length; i++) {
            MultipartFile attach = test[i];
            String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000, 99999999) + "_Personal.jpg";
            File targetFile = new File(path, fileName);
            try {
                attach.transferTo(targetFile);

            } catch (IOException e) {
                e.printStackTrace();

            }
            idPicPath.append(fileName + "@");
        }
        Crminfo crminfo = CommonUtils.getUser(request, response);
        crmcustomerdetails.setFollowupId(crminfo.getUserId());
        crmcustomerdetails.setCreateTime(new Timestamp(System.currentTimeMillis()));
        crmcustomerdetails.setChatrecord(idPicPath.toString());
        crmcustomerdetails.setFollowupTime(DateUtil.strToSqlDate(createData));
        if (crmcustomerdetailsService.insertCrmcustomerdetails(crmcustomerdetails)) {
            map.put("message", true);
            map.put("error", null);
        } else {
            map.put("message", false);
            map.put("error", "上传失败！");
        }
        return map;
    }

    /**
     * 删除客户
     *
     * @param id
     * @return
     */
    @RequestMapping("deleteCustomer.do")
    public Object deleteCustomer(Integer id) {
        if(crmcustomersinfoService.deleteCrmcustomerssinfo(id)){
            return  true;
        }
        return false;
    }

    @RequestMapping("toupdateCustomer.do")
    public Object toupdateCustomer(Crmcustomersinfo crmcustomersinfo) {
        if(crmcustomersinfoService.updateCrmcustomersinfo(crmcustomersinfo)){
            return  true;
        }
        return false;
    }
}
