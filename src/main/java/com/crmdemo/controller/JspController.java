package com.crmdemo.controller;

import com.crmdemo.entity.*;
import com.crmdemo.service.*;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.util.CookieUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

@Controller
public class JspController {
    @Resource
    ProvincesService provincesService;
    @Resource
    CrmagentsinfoService crmagentsinfoService;
    @Resource
    AgencystaffService agencystaffService;
    @Resource
    CrmcustomersinfoService crmcustomersinfoService;
    @Resource
    CrminfoService crminfoService;
    @Resource
    CrmcustomerallocateService crmcustomerallocateService;
    @Resource
    CrmcustomerorderService crmcustomerorderService;
    @Resource
    InformationService informationService;
    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("index.do")
    public String index(HttpServletRequest request,HttpServletResponse response) {
        String strCookieValue = CookieUtils.getCookie(request, CookieUtils.COOKIE_NAME_LOGININFO);
        if (strCookieValue != null && !strCookieValue.equals("")) {
            Crminfo crminfo=CommonUtils.getUser(request,response);
            request.getSession().setAttribute("user",crminfo);
            Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
            crmcustomersinfo.setAdduserId(crminfo.getUserId());
            crmcustomersinfo.setBeOverdue(new Date(System.currentTimeMillis()));
            crmcustomersinfo.setReadingState(1);
            List<Crmcustomersinfo> crmcustomersinfos=crmcustomersinfoService.selectCrmcustomersinfosByUser(crmcustomersinfo);
            informationService.insertInformationEveryDay(crmcustomersinfos,crminfo);
            return "common/left";
        } else {
            // 未登陆
            return "login";
        }

    }

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("doindex.do")
    public String doindex() {
        return "index";
    }

    /**
     * 客户管理页面
     *
     * @return
     */
    @RequestMapping("customer.do")
    public String customer() {
        return "crm/customer";
    }

    /**
     * 添加客户页面
     *
     * @return
     */
    @RequestMapping("addcustomer.do")
    public String addcustomer(ModelMap modelMap) {
        modelMap.put("provinces", provincesService.selectProList());
        return "crm/customer_add";
    }

    /**
     * 代理商管理页面
     *
     * @return
     */
    @RequestMapping("agent.do")
    public String agent(HttpServletRequest request,HttpServletResponse response) {
        Crminfo crminfo=CommonUtils.getUser(request,response);
        if(crminfo.getRoleId()==1 && crminfo.getRoleId()==2 && crminfo.getRoleId()==3 && crminfo.getRoleId()==4){
            return "crm/agent";
        }else {
            return "noJurisdiction";
        }

    }

    /**
     * 添加代理商页面
     *
     * @return
     */
    @RequestMapping("addAgent.do")
    public String addAgent(HttpServletRequest request,HttpServletResponse response) {
        Crminfo crminfo=CommonUtils.getUser(request,response);
        if(crminfo.getRoleId()==1 && crminfo.getRoleId()==2 && crminfo.getRoleId()==3 && crminfo.getRoleId()==4){
            return "crm/agent_add";
        }else {
            return "noJurisdiction";
        }

    }

    /**
     * 用户注销
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/logout.do")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        String param = request.getParameter("param");
        HttpSession session = request.getSession();
        session.invalidate();
        CookieUtils.addCookie(response, CookieUtils.COOKIE_NAME_LOGININFO, "", "/", -60 * 60 * 24 * 30);
        ModelAndView mav = null;
        mav = new ModelAndView("redirect:index.do");
        return mav;
    }

    /**
     * 修改代理商页面
     * @param modelMap
     * @param crmagentsinfo
     * @return
     */
    @RequestMapping("agentUpdate.do")
    public String agentUpdate(ModelMap modelMap, Crmagentsinfo crmagentsinfo){
        Crmagentsinfo crmagentsinfo1=new Crmagentsinfo();
        crmagentsinfo1.setId(crmagentsinfo.getId());
        modelMap.put("agent",crmagentsinfoService.selectCrmagentsinfoList(crmagentsinfo1).get(0));
        return "crm/agent_update";
    }

    /**
     * 代理人员页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("toagencyStaff.do")
    public String toagencyStaff(HttpServletRequest request, HttpServletResponse response){
       Crminfo crminfo= CommonUtils.getUser(request,response);
        if(crminfo.getRoleId()==1 && crminfo.getRoleId()==2 && crminfo.getRoleId()==3 && crminfo.getRoleId()==4 &&crminfo.getRoleId()==5 ){
            return "crm/agencyStaff";
        }else {
            return "noJurisdiction";
        }
    }

    /**
     * 增加代理商员工页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("toagencyStaffadd.do")
    public String toagencyStaffadd(HttpServletRequest request, HttpServletResponse response){
        if(CommonUtils.getUser(request,response).getRoleId()==5 || CommonUtils.getUser(request,response).getRoleId()==1){
            return "crm/agencyStaff_add";
        }else {
            return "noJurisdiction";
        }
    }

    /**
     * 代理商员工修改页面
     * @param request
     * @param response
     * @param agencystaff
     * @param modelMap
     * @return
     */
    @RequestMapping("agencyStaffupdate.do")
    public String agencyStaffupdate(HttpServletRequest request, HttpServletResponse response, Agencystaff agencystaff,ModelMap modelMap){
        if(CommonUtils.getUser(request,response).getRoleId()==5 || CommonUtils.getUser(request,response).getRoleId()==1){
            modelMap.put("agencystaff",agencystaffService.selectAgencystaffById(agencystaff));
            return "crm/agencyStaff_update";
        }else {
            return "noJurisdiction";
        }
    }

    /**
     * 客户分配页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("toChoice.do")
    public String toChoice(String id,ModelMap modelMap){
        modelMap.put("id",id);
        return "crm/choice";
    }

    /**
     * 新增跟进页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("followup.do")
    public String followup(String id,ModelMap modelMap,String customersName){
        modelMap.put("customerId",id);
        modelMap.put("customersName",customersName);
        return "crm/follow_up";
    }

    /**
     * 客户修改页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("updateCustomer.do")
    public String updateCustomer(Integer id,ModelMap modelMap){
        modelMap.put("customer",crmcustomersinfoService.selectCrmcustomersinfoById(id));
        modelMap.put("provinces", provincesService.selectProList());
        return "crm/customer_update";
    }

    /**
     * 转移代理商页面
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("transferAgent.do")
    public String transferAgent(HttpServletRequest request,ModelMap modelMap){
        modelMap.put("id",request.getParameterValues("id[]"));
        return "crm/transfer";
    }

    /**
     * 转移代理商资源页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("torotaationAgent.do")
    public String torotaationAgent(Integer id,ModelMap modelMap){
        modelMap.put("id",id);
        return "crm/agent_rotation";
    }

    /**
     * 转移代理商员工页面
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("toTransferAgencyStaff.do")
    public String toTransferAgencyStaff(HttpServletRequest request,ModelMap modelMap){
        modelMap.put("id",request.getParameterValues("id[]"));
        return "crm/agencyStaff_transfer";
    }

    /**
     * 转移代理商员工资源页面
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("torotaationAgentStaff.do")
    public String torotaationAgentStaff(Integer id,ModelMap modelMap){
        modelMap.put("id",id);
        return "crm/agenStaff_rotation";
    }

    /**
     * 批量转移客户
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("toCustomerTransfer.do")
    public String toCustomerTransfer(HttpServletRequest request,ModelMap modelMap){
        modelMap.put("id",request.getParameterValues("id[]"));
        return "crm/customer_transfer";
    }

    /**
     * 批量分配客户
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("toCustomerRotation.do")
    public String toCustomerRotation(HttpServletRequest request,ModelMap modelMap){
        modelMap.put("id",request.getParameterValues("id[]"));
        return "crm/customer_rotation";
    }

    /**
     * 客户跟进记录页面
     * @param id
     * @return
     */
    @RequestMapping("tofollowUpDeltail.do")
    public String tofollowUpDeltail(String id,ModelMap modelMap,Integer id1){
        if(null != id1){
            Information information=new Information();
            information.setMationId(id1);
            information.setMationStatus(2);
            informationService.updateInformation(information);
        }
        Crmcustomersinfo crmcustomersinfo=crmcustomersinfoService.selectCrmcustomersinfoById(Integer.parseInt(id));
        Crminfo addCrmifo=crminfoService.selectCrminfoById(crmcustomersinfo.getAdduserId());
        Crmcustomerallocate crmcustomerallocate=new Crmcustomerallocate();
        crmcustomerallocate.setIsRelation(0);
        crmcustomerallocate.setCustomerId(crmcustomersinfo.getId());
        List<Crmcustomerallocate> crmcustomerallocates=crmcustomerallocateService.selectCrmcustomerallocateList(crmcustomerallocate);
        Crminfo fzrCrminfo=null;
        if(crmcustomerallocates.size()>0){
            fzrCrminfo=crminfoService.selectCrminfoById(crmcustomerallocates.get(0).getBeiuserId());
        }
        modelMap.put("addCrmifo",addCrmifo);
        modelMap.put("fzrCrminfo",fzrCrminfo);
        modelMap.put("crmcustomersinfo",crmcustomersinfo);
        return "crm/follow_up_detail";
    }

    /**
     * 地图
     * @return
     */
    @RequestMapping("map.do")
    public String map(){
        return "crm/map";
    }

    /**
     * 签单
     * @return
     */
    @RequestMapping("toContract.do")
    public String toContract(){
        return "crm/contract";
    }

    /**
     * 新建签单
     * @return
     */
    @RequestMapping("toContract_add.do")
    public String toContractadd(HttpServletResponse response,HttpServletRequest request,ModelMap modelMap){
        Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
        crmcustomersinfo.setAdduserHierarchy(CommonUtils.getUser(request,response).getUserArrangement());
        List<Crmcustomersinfo> crmcustomersinfos=crmcustomersinfoService.selectCustomersByUser(crmcustomersinfo);
        modelMap.put("crmcustomersinfos",crmcustomersinfos);
        return "crm/contract_add";
    }

    /**
     * 审批
     * @return
     */
    @RequestMapping("toSubject.do")
    public String toSubject(){
        return "crm/subject";
    }

    /**
     * 刷脸测试页面
     * @return
     */
    @RequestMapping("toRecognition.do")
    public String toRecognition(){
        return "crm/recognition";
    }

    /**
     * 修改签单
     * @param id
     * @return
     */
    @RequestMapping("toContractUpdate.do")
    public String toContractUpdate(HttpServletResponse response,HttpServletRequest request,Integer id,ModelMap modelMap){
        Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
        crmcustomersinfo.setAdduserHierarchy(CommonUtils.getUser(request,response).getUserArrangement());
        List<Crmcustomersinfo> crmcustomersinfos=crmcustomersinfoService.selectCustomersByUser(crmcustomersinfo);
        modelMap.put("crmcustomersinfos",crmcustomersinfos);
        modelMap.put("orders",crmcustomerorderService.selectCrmcustomerorderById(id));
        return "crm/contract_update";
    }

    /**
     * 财务查看客户信息资料
     * @param id
     * @param modelMap
     * @return
     */
    @RequestMapping("touserinformation.do")
    public String touserinformation(String id,ModelMap modelMap){
        Crmcustomersinfo crmcustomersinfo=crmcustomersinfoService.selectCrmcustomersinfoById(Integer.parseInt(id));
        modelMap.put("crmcustomersinfo",crmcustomersinfo);
        return "crm/userinformation";
    }

    /**
     * 审批记录页面
     * @return
     */
    @RequestMapping("toAuditrecord.do")
    public String toAuditrecord(){
        return "crm/auditrecord";
    }

    /**
     * 设置过期时间页面
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("toExpirytime.do")
    public String toExpirytime(HttpServletRequest request,ModelMap modelMap){
        String[] ids = request.getParameterValues("id[]");
        modelMap.put("ids",ids);
        return "crm/customer_expirytime";
    }

    /**
     * 用户提醒页面
     * @return
     */
    @RequestMapping("toAllNews.do")
    public String toAllNews(){
        return "crm/allNews";
    }

    /**
     * 我的跟进记录页面
     * @return
     */
    @RequestMapping("toMyFollow.do")
    public String toMyFollow(){
        return "crm/myFollow_up_detail";
    }


}




