package com.crmdemo.controller;

import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrmagentsinfoService;
import com.crmdemo.service.ProvincesService;
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

@Controller
public class JspController {
    @Resource
    ProvincesService provincesService;
    @Resource
    CrmagentsinfoService crmagentsinfoService;

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("index.do")
    public String index(HttpServletRequest request,HttpServletResponse response) {
        String strCookieValue = CookieUtils.getCookie(request, CookieUtils.COOKIE_NAME_LOGININFO);
        if (strCookieValue != null && !strCookieValue.equals("")) {
            request.getSession().setAttribute("user",CommonUtils.getUser(request,response));
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
        if(crminfo.getRoleId()!=5 && crminfo.getRoleId()!=6){
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
        if(crminfo.getRoleId()!=5 && crminfo.getRoleId()!=6){
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
        if(CommonUtils.getUser(request,response).getRoleId()!=6){
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
}




