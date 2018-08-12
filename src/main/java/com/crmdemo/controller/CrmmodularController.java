package com.crmdemo.controller;

import com.crmdemo.dao.CrmmodularDao;
import com.crmdemo.entity.Crmmodular;
import com.crmdemo.entity.Crmproductservice;
import com.crmdemo.service.impl.CrmmodularServiceImpl;
import com.crmdemo.service.impl.CrmproductserviceServiceImpl;
import com.crmdemo.vop.Crmmodularvop;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class CrmmodularController {
    @Resource
    private CrmmodularServiceImpl crmmodularService;
    @Resource
    private CrmproductserviceServiceImpl crmproductserviceService;
    //查询
    @ResponseBody
    @RequestMapping("/selectcrmmodular.do")
    public List<Crmmodularvop> selectcrmmodular(@RequestParam(value = "id", required = false) String id) {
        List<Crmmodularvop> crmmodularDaos =crmmodularService.selectcrmmodular(id);
        return crmmodularDaos;
    }

    //更新
    @ResponseBody
    @RequestMapping("updatecrmmodular.do")
    public boolean updatecrmmodular(Crmmodular crmmodular) {
        boolean sf = false;
        crmmodular.setUpdateTime(new Date());
        int i = crmmodularService.updatecrmmodular(crmmodular);
        if (i > 0) {
            sf = true;
        }
        return sf;
    }

    //删除
    @ResponseBody
    @RequestMapping("delcrmmodular.do")
    public boolean delcrmmodular(String id) {
        boolean sf = false;
        int i = crmmodularService.delcrmmodular(id);
        if (i > 0) {
            sf = true;
        }
        return sf;
    }

    //添加
    @ResponseBody
    @RequestMapping("addcrmmodular.do")
    public boolean addcrmmodular(Crmmodular crmmodular) {
        boolean sf = false;
        List<Crmmodularvop> crmmodularDaos =crmmodularService.selectcrmmodular(null);
        if(crmmodularDaos.size()==0){
            crmmodular.setCreateTime(new Date());
            crmmodularService.addcrmmodular(crmmodular);
            return true;
        }
        for (Crmmodularvop crm:crmmodularDaos){
            if(!crm.getModularName().equals(crmmodular.getModularName())){
                crmmodular.setCreateTime(new Date());
                int i = crmmodularService.addcrmmodular(crmmodular);
                if(i>0){
                    sf=true;
                    return sf;
                }
            }
        }
        return sf;
    }
}
