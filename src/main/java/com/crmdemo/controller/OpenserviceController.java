package com.crmdemo.controller;

import com.crmdemo.entity.Crminfo;
import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.entity.Openservice;
import com.crmdemo.entity.Provinces;
import com.crmdemo.service.impl.OpenserviceServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.*;

@Controller
public class OpenserviceController {

    @Resource
    private OpenserviceServiceImpl openserviceService;


    //开通服务
    @ResponseBody
    @RequestMapping("/isOpenserviceService")
    public boolean isOpenserviceService(Openservice openservice, HttpSession session, @RequestParam(value = "checkedList[]",required=false) String[] checkedList){
        boolean sf=false;
        openserviceService.deleteOpenservice(openservice.getCrmcustomersinfoid());
        if(checkedList!=null){
            Crminfo crminfo= (Crminfo) session.getAttribute("user");
            openservice.setIsopen(1);
            openservice.setUserId(crminfo.getUserId());
            openservice.setCreateDate(new Date());
            int b=0;
          for (int i=0;i<checkedList.length;i++){
              openservice.setOpenserviceTypeid(checkedList[i]);
              b=openserviceService.insertOpenservice(openservice);
          }
          if(b>0){
              sf=true;
          }
        }
        return sf;
    }

    //验证客户有开通服务
    @ResponseBody
    @RequestMapping("/yesOpenserviceService")
    public List<String> yesOpenserviceService(String crmcustomersinfoid){
        List<String> strings=new ArrayList<String>();
        List<Openservice> list=openserviceService.selectOpenservice(crmcustomersinfoid);
            for (Openservice ope:list){
                   strings.add(ope.getOpenserviceTypeid());
            }
        return strings;
    }
}