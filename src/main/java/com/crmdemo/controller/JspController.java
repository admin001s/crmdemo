package com.crmdemo.controller;

import com.crmdemo.service.ProvincesService;
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

    /**
     * 登录页面
     *
     * @return
     */
    @RequestMapping("index.do")
    public String index(HttpServletRequest request) {
        String strCookieValue = CookieUtils.getCookie(request, CookieUtils.COOKIE_NAME_LOGININFO);
        if (strCookieValue != null && !strCookieValue.equals("")) {
            return "index";
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
    public String agent() {
        return "crm/agent";
    }

    /**
     * 添加代理商页面
     *
     * @return
     */
    @RequestMapping("addAgent.do")
    public String addAgent() {
        return "crm/agent_add";
    }

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
}




