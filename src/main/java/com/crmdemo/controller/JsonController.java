package com.crmdemo.controller;

import com.alibaba.fastjson.JSON;
import com.crmdemo.entity.*;
import com.crmdemo.service.*;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.util.DateUtil;
import com.crmdemo.util.HttpUtil;
import com.crmdemo.vop.AuditrecordVop;
import com.crmdemo.vop.CrmcustomerallocateVop;
import com.crmdemo.vop.CrmcustomerdetailsVop;
import com.crmdemo.vop.CrmcustomerorderVop;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
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
    @Resource
    CrmcustomerorderService crmcustomerorderService;
    @Resource
    AuditrecordService auditrecordService;
    @Resource
    InformationService informationService;

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
        crminfo.setIsavailable(0);
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
        return crmagentsinfoService.selectCrmagentsinfoListByCondition(crmagentsinfo);
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
        if (crmagentsinfoService.updateCrmagentsinfo(crmagentsinfo)) {
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
        if (crmagentsinfoService.deleteCrmagentsinfo(crmagentsinfo)) {
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
        return agencystaffService.selectAgencystaffListByCondition(agencystaff);
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
            crminfo.setIsavailable(0);
            if (crminfoService.insertCrminfo(crminfo)) {
                agencystaff.setAddCreateTime(new Timestamp(System.currentTimeMillis()));
                String[] strs = CommonUtils.getUser(request, response).getUserArrangement().split("/");
                Crmagentsinfo crmagentsinfo = new Crmagentsinfo();
                crmagentsinfo.setAgentCharacterrelationship(CommonUtils.getUser(request, response).getUserArrangement());
                agencystaff.setAgentStaffParentid(crmagentsinfoService.selectCrmagentsinfoList(crmagentsinfo).get(0).getId());
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
     *
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
        String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles");
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
        if (crmcustomersinfoService.deleteCrmcustomerssinfo(id)) {
            return true;
        }
        return false;
    }

    /**
     * 修改客户信息
     *
     * @param crmcustomersinfo
     * @return
     */
    @RequestMapping("toupdateCustomer.do")
    public Object toupdateCustomer(Crmcustomersinfo crmcustomersinfo) {
        if (crmcustomersinfoService.updateCrmcustomersinfo(crmcustomersinfo)) {
            return true;
        }
        return false;
    }

    /**
     * 转移代理商
     *
     * @param beiuserId
     * @param request
     * @return
     */
    @RequestMapping("transferAgentList.do")
    public Object transferAgentList(String beiuserId, HttpServletRequest request) {
        String[] id = request.getParameterValues("id[]");
        if (crmagentsinfoService.updateAgentsTransfer(id, beiuserId)) {
            return true;
        }
        return false;
    }

    /**
     * 检查代理商下是否有资源
     *
     * @param id
     * @return
     */
    @RequestMapping("isSubordinateRepeat.do")
    public Object isSubordinateRepeat(Integer id) {
        return crmagentsinfoService.isSubordinateRepeat(id);
    }

    /**
     * 删除代理商并且转移资源
     *
     * @param id
     * @param beiuserId
     * @return
     */
    @RequestMapping("rotaationAgent.do")
    public Object rotaationAgent(String id, String beiuserId, HttpServletResponse response, HttpServletRequest request) {
        return crmagentsinfoService.deleteCrmagentsinfoAndTransfer(id, beiuserId, response, request);
    }

    /**
     * 转移代理商员工
     *
     * @param beiuserId
     * @param request
     * @return
     */
    @RequestMapping("transferAgencyStaffList.do")
    public Object transferAgencyStaffList(String beiuserId, HttpServletRequest request) {
        String[] id = request.getParameterValues("id[]");
        return agencystaffService.updateAgentstaffTransfer(id, beiuserId);
    }

    /**
     * 检查代理商员工下是否有资源
     *
     * @param id
     * @return
     */
    @RequestMapping("isSubordinateRepeatAsstaff.do")
    public Object isSubordinateRepeatAsstaff(Integer id) {
        return agencystaffService.isSubordinateRepeat(id);
    }

    /**
     * 删除并转移资源
     *
     * @param id
     * @param beiuserId
     * @return
     */
    @RequestMapping("rotaationAgentStaff.do")
    public Object rotaationAgentStaff(String id, String beiuserId, HttpServletResponse response, HttpServletRequest request) {
        return agencystaffService.deleteAgentstaffAndTransfer(id, beiuserId, response, request);
    }

    /**
     * 转移客户
     *
     * @param request
     * @param response
     * @param beiuserId
     * @return
     */
    @RequestMapping("transferCustomer.do")
    public Object transferCustomer(HttpServletRequest request, HttpServletResponse response, String beiuserId) {
        String[] id = request.getParameterValues("id[]");
        return crmcustomersinfoService.updateCustomersTransfer(id, beiuserId, request, response);
    }

    /**
     * 分配客户
     *
     * @param request
     * @param response
     * @param beiuserId
     * @return
     */
    @RequestMapping("customerRotation.do")
    public Object customerRotation(HttpServletRequest request, HttpServletResponse response, String beiuserId) {
        String[] id = request.getParameterValues("id[]");
        return crmcustomersinfoService.rotationCustomers(id, beiuserId, request, response);
    }

    /**
     * 跟进记录
     *
     * @param request
     * @param response
     * @param id
     * @return
     */
    @RequestMapping("responsible.do")
    public Object responsible(HttpServletRequest request, HttpServletResponse response, Integer id) {
        List<CrmcustomerdetailsVop> crmcustomerdetailsVops = crmcustomerdetailsService.selectCrmcustomerdetailsVopList(id, request, response);
        return crmcustomerdetailsVops;
    }

    /**
     * 新建签单
     *
     * @param request
     * @param response
     * @param crmcustomerorder
     * @return
     */
    @RequestMapping("contract_add.do")
    public Object contractadd(HttpServletRequest request, HttpServletResponse response, Crmcustomerorder crmcustomerorder) {
        crmcustomerorder.setSigningfollowupId(CommonUtils.getUser(request, response).getUserId());
        crmcustomerorder.setFollowupHierarchy(CommonUtils.getUser(request, response).getUserArrangement());
        crmcustomerorder.setSigningStatus(1);
        crmcustomerorder.setSigningTime(new Timestamp(System.currentTimeMillis()));
        crmcustomerorder.setIsdelete(0);
        return crmcustomerorderService.insertCrmcustomerorder(crmcustomerorder);
    }

    /**
     * 获取签单数据
     *
     * @param crmcustomerorderVop,crminfo,crmcustomersinfo
     * @return
     */
    @RequestMapping("contract.do")
    public Object contract(HttpServletRequest request, HttpServletResponse response, CrmcustomerorderVop crmcustomerorderVop, Crminfo crminfo, Crmcustomersinfo crmcustomersinfo) {
        crminfo.setUserArrangement(CommonUtils.getUser(request, response).getUserArrangement());
        crmcustomerorderVop.setCrminfo(crminfo);
        crmcustomerorderVop.setCrmcustomersinfo(crmcustomersinfo);
        return crmcustomerorderService.selectCrmcustomerorderVopList(crmcustomerorderVop);
    }

    /**
     * 刷脸登录
     * @param base
     * @return
     */
    @RequestMapping("recognition.do")
    public Object recognition(HttpServletRequest request,String base) {
        /*BufferedReader br = null;
        StringBuffer sb = new StringBuffer();

        String authHost = "https://aip.baidubce.com/oauth/2.0/token?";

        String clientId = "KIPFzpthAly8ZUPwGOtgOTuG";
        String clientSecret = "27LdQPdcyk9YGZGrpcc9rzZ64z9d3rQ6 ";
        String getAccessTokenUrl = authHost + "grant_type=client_credentials"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret;

        URL url = null;
        try {
            url = new URL(getAccessTokenUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.connect();
            br = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line = "";
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        JSONObject jsonObject = JSONObject.fromObject(sb.toString());
        String token = jsonObject.getString("access_token");*/
        String result = "";
        /*String result3="";
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", base);
            map.put("face_field", "face_token,age,beauty,expression,face_shape,gender,glasses,landmark,race,quality,face_type");
            map.put("image_type", "BASE64");
            map.put("face_type", "LIVE");
            String param = JSON.toJSON(map).toString();
            String accessToken = token;
            result = HttpUtil.post(url, accessToken, "application/json", param);
            JSONObject jsonObject1 = JSONObject.fromObject(result);
            String result1 = jsonObject1.getString("result");
            JSONObject jsonObject2 = JSONObject.fromObject(result1);
            String result2 = jsonObject2.getString("face_list");
            result2=result2.substring(1,result2.length()-1);
            JSONObject jsonObject3 = JSONObject.fromObject(result2);
            result3= jsonObject3.getString("face_token");
        } catch (Exception e) {

        }*/
        /*人脸登录*/
        String url1 = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", base);
            map.put("liveness_control", "HIGH");
            map.put("group_id_list", "1");
            map.put("image_type", "BASE64");
            map.put("quality_control", "NORMAL");
            map.put("max_user_num",3);
            String param = JSON.toJSON(map).toString();
            String accessToken = "24.4d12674f563ba24b21b5d6a094a2f118.2592000.1537147643.282335-11686332";
            result = HttpUtil.post(url1, accessToken, "application/json", param);
            request.getSession().setAttribute("base",base);
        } catch (Exception e) {

        }
        /*增加人脸*/
        /*String url1 = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", result3);
            map.put("group_id", "1");
            map.put("user_id", "1");
            map.put("user_info", "天星");
            map.put("liveness_control", "HIGH");
            map.put("image_type", "FACE_TOKEN");
            map.put("quality_control", "HIGH");
            String param = JSON.toJSON(map).toString();
            String accessToken = token;

            result = HttpUtil.post(url1, accessToken, "application/json", param);
            System.out.println(result);
        } catch (Exception e) {

        }*/
        /*人脸对比*/
        /*String url1 = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
            List<Map<String, Object>> images = new ArrayList<>();
            Map<String, Object> map1 = new HashMap<>();
            map1.put("image", base);
            map1.put("image_type", "BASE64");
            map1.put("face_type", "LIVE");
            map1.put("quality_control", "LOW");
            map1.put("liveness_control", "NORMAL");

            Map<String, Object> map2 = new HashMap<>();
            map2.put("image", base);
            map2.put("image_type", "BASE64");
            map2.put("face_type", "LIVE");
            map2.put("quality_control", "LOW");
            map2.put("liveness_control", "NORMAL");

            images.add(map1);
            images.add(map2);
            String param = JSON.toJSON(images).toString();
            String accessToken = token;

            String result = HttpUtil.post(url1, accessToken, "application/json", param);
            System.out.println(result);
        } catch (Exception e) {

        }*/
        return result;
    }

    /**
     * 人脸对比
     * @param userId
     * @param
     * @param
     * @return
     */
    @RequestMapping("contrast.do")
    public Object contrast(Integer userId,String base){
        /*BufferedReader br = null;
        StringBuffer sb = new StringBuffer();

        String authHost = "https://aip.baidubce.com/oauth/2.0/token?";

        String clientId = "KIPFzpthAly8ZUPwGOtgOTuG";
        String clientSecret = "27LdQPdcyk9YGZGrpcc9rzZ64z9d3rQ6 ";
        String getAccessTokenUrl = authHost + "grant_type=client_credentials"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret;
        try {
            URL url = new URL(getAccessTokenUrl);
            HttpURLConnection connection = (HttpURLConnection) url
                    .openConnection();
            connection.setRequestMethod("POST");
            connection.connect();
            br = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line = "";
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            br.close();
        } catch (Exception e) {

        }
        JSONObject jsonObject = JSONObject.fromObject(sb.toString());
        String token = jsonObject.getString("access_token");*/
        String result = "";
        String results = "";
        String result3 = "";
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/face/getlist";
        String accessToken = "24.4d12674f563ba24b21b5d6a094a2f118.2592000.1537147643.282335-11686332";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("user_id", userId);
            map.put("group_id", 1);
            String param =JSON.toJSON(map).toString();
            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。

            results = HttpUtil.post(url, accessToken, "application/json", param);
            JSONObject jsonObject1 = JSONObject.fromObject(results);
            String result1 = jsonObject1.getString("result");
            JSONObject jsonObject2 = JSONObject.fromObject(result1);
            String result2 = jsonObject2.getString("face_list");
            result2=result2.substring(1,result2.length()-1);
            JSONObject jsonObject3 = JSONObject.fromObject(result2);
            result3= jsonObject3.getString("face_token");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String url1 = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
            List<Map<String, Object>> images = new ArrayList<>();
            Map<String, Object> map1 = new HashMap<>();
            map1.put("image", result3);
            map1.put("image_type", "FACE_TOKEN");
            map1.put("face_type", "LIVE");
            map1.put("quality_control", "LOW");
            map1.put("liveness_control", "HIGH");

            Map<String, Object> map2 = new HashMap<>();
            map2.put("image",base);
            map2.put("image_type", "BASE64");
            map2.put("face_type", "LIVE");
            map2.put("quality_control", "LOW");
            map2.put("liveness_control", "HIGH");
            images.add(map1);
            images.add(map2);
            String param = JSON.toJSON(images).toString();
            result = HttpUtil.post(url1, accessToken, "application/json", param);
        } catch (Exception e) {

        }
        return result;
    }
    @RequestMapping("quality.do")
    public Object quality(HttpServletRequest request,String base){
        String result3="";
        String result="";
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";
        Integer result4=0;
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", base);
            map.put("face_field", "quality,expression,face_shape,gender,glasses,face_type");
            map.put("image_type", "BASE64");
            map.put("face_type", "LIVE");
            String param = JSON.toJSON(map).toString();
            String accessToken = "24.4d12674f563ba24b21b5d6a094a2f118.2592000.1537147643.282335-11686332";
            result = HttpUtil.post(url, accessToken, "application/json", param);
            JSONObject jsonObject1 = JSONObject.fromObject(result);
            String result1 = jsonObject1.getString("result");
            JSONObject jsonObject2 = JSONObject.fromObject(result1);
            String result2 = jsonObject2.getString("face_list");
            result2=result2.substring(1,result2.length()-1);
            JSONObject jsonObject3= JSONObject.fromObject(result2);
            result2 = jsonObject3.getString("quality");
            JSONObject jsonObject4= JSONObject.fromObject(result2);
            result4 = jsonObject4.getInt("completeness");
        } catch (Exception e) {

        }
        if(result4==1){
            return true;
        }else {
            return false;
        }
    }
    /**
     * 刷脸登录后操作
     * @param userId
     * @param session
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("login2.do")
    public Object login2(Integer userId, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        Crminfo crminfo = crminfoService.selectCrminfoById(userId);
        if (crminfo != null) {
            CommonUtils.saveLoginInfoToCookie(request, response, crminfo);
            session.setAttribute("user",crminfo);
            return true;
        }
        return false;
    }

    /**
     * 获取审核
     * @param request
     * @param response
     * @param crmcustomerorderVop
     * @param crminfo
     * @param crmcustomersinfo
     * @return
     */
    @RequestMapping("subject.do")
    public Object subject(HttpServletRequest request, HttpServletResponse response, CrmcustomerorderVop crmcustomerorderVop, Crminfo crminfo, Crmcustomersinfo crmcustomersinfo){
        crminfo.setUserArrangement(CommonUtils.getUser(request, response).getUserArrangement());
        crmcustomerorderVop.setCrminfo(crminfo);
        crmcustomerorderVop.setCrmcustomersinfo(crmcustomersinfo);
        crmcustomerorderVop.setSigningStatus(1);
        return crmcustomerorderService.selectCrmcustomerorderVopList(crmcustomerorderVop);
    }

    /**
     * 审核操作
     * @param id
     * @param status
     * @return
     */
    @RequestMapping("subjectCz.do")
    public Object subjectCz(Integer id,Integer status,HttpServletRequest request,HttpServletResponse response){
        return crmcustomerorderService.updateCrmcustomerorderStatus(id,status,1,CommonUtils.getUser(request,response));
    }

    /**
     * 批量审核操作
     * @param status
     * @param request
     * @return
     */
    @RequestMapping("subjectCzs.do")
    public Object subjectCzs(Integer status,HttpServletRequest request,HttpServletResponse response){
        String[] ids = request.getParameterValues("id[]");
        return  crmcustomerorderService.updateCrmcustomerordersStatus(ids,status,1,CommonUtils.getUser(request,response));
    }

    /**
     * 批量再次提交
     * @param status
     * @param request
     * @return
     */
    @RequestMapping("agains.do")
    public Object agains(Integer status,HttpServletRequest request,HttpServletResponse response){
        String[] ids = request.getParameterValues("id[]");
        return  crmcustomerorderService.updateCrmcustomerordersStatus(ids,status,0,null);
    }

    /**
     * 再次提交
     * @param id
     * @param status
     * @return
     */
    @RequestMapping("again.do")
    public Object again(Integer id,Integer status,HttpServletRequest request,HttpServletResponse response){
        return crmcustomerorderService.updateCrmcustomerorderStatus(id,status,0,null);
    }

    /**
     * 删除签单
     * @param id
     * @return
     */
    @RequestMapping("delcrmcustomerorder.do")
    public Object delcrmcustomerorder(Integer id){
        return crmcustomerorderService.deleteCrmcustomerorder(id);
    }

    /**
     * 修改签单
     * @param crmcustomerorder
     * @return
     */
    @RequestMapping("updateCustomerorder.do")
    public Object updateCustomerorder(Crmcustomerorder crmcustomerorder){
        return  null;
    }

    /**
     * 审批记录
     * @param auditrecordVop
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("auditrecord.do")
    public Object auditrecord(AuditrecordVop auditrecordVop,HttpServletRequest request,HttpServletResponse response,Crminfo crminfo,Crmcustomerorder crmcustomerorder){
        auditrecordVop.setCrmcustomerorder(crmcustomerorder);
        crminfo.setUserArrangement(CommonUtils.getUser(request,response).getUserArrangement());
        auditrecordVop.setCrminfo(crminfo);
        return auditrecordService.selectAuditrecordVops(auditrecordVop);
    }

    /**
     * 设置过期时间
     * @param indate
     * @return
     */
    @RequestMapping("expiryTime.do")
    public Object expiryTime(String indate,HttpServletRequest request){
        Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
        String[] ids = request.getParameterValues("ids[]");
        crmcustomersinfo.setBeOverdue(DateUtil.strToDate(indate));
        return crmcustomersinfoService.updateCustomersBeOverdue(ids,crmcustomersinfo);
    }

    /**
     * 获取用户今日过期客户信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("getMation.do")
    public Object getMation(HttpServletRequest request,HttpServletResponse response){
        Information information=new Information();
        information.setMationStatus(1);
        information.setUserId(CommonUtils.getUser(request,response).getUserId());
        return informationService.selectInfomations(information);
    }

    /**
     * 获取用户全部信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("allNews.do")
    public Object allNews(HttpServletRequest request,HttpServletResponse response){
        Information information=new Information();
        information.setUserId(CommonUtils.getUser(request,response).getUserId());
        return informationService.selectInfomations(information);
    }

    /**
     * 根据用户修改信息状态
     * @param request
     * @param response
     * @param mationStatus
     * @return
     */
    @RequestMapping("upAllNewsStatus.do")
    public Object upAllNewsStatus(HttpServletRequest request,HttpServletResponse response,Integer mationStatus){
        Information information=new Information();
        information.setUserId(CommonUtils.getUser(request,response).getUserId());
        information.setMationStatus(mationStatus);
        return informationService.updateInformationByUser(information);
    }

    /**
     * 获取我的跟进记录数据
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("myFollow.do")
    public Object myFollow(HttpServletRequest request,HttpServletResponse response){
        return crmcustomerdetailsService.selectcrmcustomerdetailsVopListByUser(CommonUtils.getUser(request,response).getUserId());
    }

    /**
     * 获取下属用户信息
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("users.do")
    public Object toUsers(HttpServletResponse response,HttpServletRequest request){
        return crminfoService.selectCrminfoByUser(CommonUtils.getUser(request,response));
    }

    /**
     * 签单统计图数据
     * @param response
     * @param request
     * @param userId
     * @return
     */
   @RequestMapping("statisticalsignature.do")
   public Object statisticalsignature(HttpServletResponse response,HttpServletRequest request,Integer userId){
        Crminfo crminfo=crminfoService.selectCrminfoById(userId);
        Map<String,Object> map=new HashMap<>();
        Crmcustomerorder crmcustomerorder=new Crmcustomerorder();
        crmcustomerorder.setSigningfollowupId(crminfo.getUserId());
        map.put("my",crmcustomerorderService.selectCrmcustomerorderCount(crmcustomerorder));
        crmcustomerorder.setSigningfollowupId(null);
        crmcustomerorder.setCustomersId(crminfo.getUserId());
        crmcustomerorder.setFollowupHierarchy(crminfo.getUserArrangement());
        map.put("all",crmcustomerorderService.selectCrmcustomerorderCount(crmcustomerorder));
        return map;
   }

    /**
     * 跟进客统计图数据
     * @param response
     * @param request
     * @param userId
     * @return
     */
    @RequestMapping("statisticalfollowup.do")
    public Object statisticalfollowup(HttpServletResponse response,HttpServletRequest request,Integer userId){
        Crminfo crminfo=crminfoService.selectCrminfoById(userId);
        Map<String,Object> map=new HashMap<>();
        CrmcustomerallocateVop crmcustomerallocateVop=new CrmcustomerallocateVop();
        crmcustomerallocateVop.setBeiuserId(crminfo.getUserId());
        map.put("my",crmcustomerallocateService.selectCrmcustomerallByUserCount(crmcustomerallocateVop));
        crmcustomerallocateVop.setBeiuserId(null);
        crmcustomerallocateVop.setCrminfo(crminfo);
        crmcustomerallocateVop.setUserId(crminfo.getUserId());
        map.put("all",crmcustomerallocateService.selectCrmcustomerallByUserCount(crmcustomerallocateVop));
       return map;
    }

    /**
     * 跟进次数统计图
     * @param response
     * @param request
     * @param userId
     * @return
     */
    @RequestMapping("statisticalfollowupCount.do")
    public Object statisticalfollowupCount(HttpServletResponse response,HttpServletRequest request,Integer userId){
        Crminfo crminfo=crminfoService.selectCrminfoById(userId);
        Map<String,Object> map=new HashMap<>();
        CrmcustomerdetailsVop crmcustomerdetailsVop=new CrmcustomerdetailsVop();
        crmcustomerdetailsVop.setFollowupId(crminfo.getUserId());
        map.put("my",crmcustomerdetailsService.selectcrmcustomerByUserCount(crmcustomerdetailsVop));
        crmcustomerdetailsVop.setFollowupId(null);
        crmcustomerdetailsVop.setCrminfo(crminfo);
        crmcustomerdetailsVop.setCrmcustomersinfoId(crminfo.getUserId());
        map.put("all",crmcustomerdetailsService.selectcrmcustomerByUserCount(crmcustomerdetailsVop));
        return map;
    }
}
