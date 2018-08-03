package com.crmdemo.interceptors;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckRights implements HandlerInterceptor {
    private Logger logger = Logger.getLogger(CheckRights.class);
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        if(httpServletRequest.getRequestURI().equals("/dologin.do") || httpServletRequest.getRequestURI().equals("/index.do")){
            return true;
        }
        else if(httpServletRequest.getSession().getAttribute("user")==null){
            httpServletResponse.sendRedirect("/index.do");
            return false;
        }
        return  true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
