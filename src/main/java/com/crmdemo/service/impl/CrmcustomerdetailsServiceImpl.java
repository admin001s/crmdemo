package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomerallocateDao;
import com.crmdemo.dao.CrmcustomerdetailsDao;
import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.entity.Crmcustomerdetails;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrmcustomerdetailsService;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.vop.CrmcustomerallocateVop;
import com.crmdemo.vop.CrmcustomerdetailsVop;
import com.crmdemo.vop.Responsible;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.util.*;

@Service
public class CrmcustomerdetailsServiceImpl implements CrmcustomerdetailsService {
    @Resource
    CrmcustomerdetailsDao crmcustomerdetailsDao;
    @Resource
    CrmcustomerallocateDao crmcustomerallocateDao;
    @Override
    public boolean insertCrmcustomerdetails(Crmcustomerdetails crmcustomerdetails) {
        try {
            if(crmcustomerdetailsDao.insertCrmcustomerdetails(crmcustomerdetails)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public List<CrmcustomerdetailsVop> selectCrmcustomerdetailsVopList(Integer id, HttpServletRequest request, HttpServletResponse response) {
        Crminfo crminfo=CommonUtils.getUser(request,response);
        List<CrmcustomerdetailsVop> crmcustomerdetailsVops=new ArrayList<CrmcustomerdetailsVop>();
        crminfo.setUserId(id);
        crmcustomerdetailsVops=crmcustomerdetailsDao.selectcrmcustomerdetailsVopList(crminfo);
        for(CrmcustomerdetailsVop crmcustomerdetailsVop:crmcustomerdetailsVops){
            crmcustomerdetailsVop.setPath(crmcustomerdetailsVop.getChatrecord().split("@"));
            crmcustomerdetailsVop.setZsT(crmcustomerdetailsVop.getCreateTime());
            java.sql.Date date=new java.sql.Date(crmcustomerdetailsVop.getZsT().getTime());
            crmcustomerdetailsVop.setCreateDate(date);
            Time time=new Time(crmcustomerdetailsVop.getZsT().getTime());
            crmcustomerdetailsVop.setTime(time);
        }
        Crmcustomerallocate crmcustomerallocate=new Crmcustomerallocate();
        crmcustomerallocate.setCustomerId(id);
        List<CrmcustomerallocateVop> crmcustomerallocateVops=crmcustomerallocateDao.selectCrmcustomerallocateVop(crmcustomerallocate);
        if(crmcustomerallocateVops.size()>0){
            for(int i=0;i<crmcustomerallocateVops.size();i++){
                if(i==0){
                    Responsible responsible=new Responsible();
                    responsible.setToresponsible(crmcustomerallocateVops.get(i).getCrminfo().getChineseName());
                    responsible.setCreateTime(crmcustomerallocateVops.get(i).getCreateTime());
                    CrmcustomerdetailsVop crmcustomerdetailsVop=new CrmcustomerdetailsVop();
                    crmcustomerdetailsVop.setResponsible(responsible);
                    crmcustomerdetailsVop.setZsT(responsible.getCreateTime());
                    java.sql.Date date=new java.sql.Date(crmcustomerdetailsVop.getZsT().getTime());
                    crmcustomerdetailsVop.setCreateDate(date);
                    Time time=new Time(crmcustomerdetailsVop.getZsT().getTime());
                    crmcustomerdetailsVop.setTime(time);
                    crmcustomerdetailsVops.add(crmcustomerdetailsVop);
                    continue;
                }
                Responsible responsible=new Responsible();
                responsible.setResponsible(crmcustomerallocateVops.get(i-1).getCrminfo().getChineseName());
                responsible.setToresponsible(crmcustomerallocateVops.get(i).getCrminfo().getChineseName());
                responsible.setCreateTime(crmcustomerallocateVops.get(i).getCreateTime());
                CrmcustomerdetailsVop crmcustomerdetailsVop=new CrmcustomerdetailsVop();
                crmcustomerdetailsVop.setResponsible(responsible);
                crmcustomerdetailsVop.setZsT(responsible.getCreateTime());
                java.sql.Date date=new java.sql.Date(crmcustomerdetailsVop.getZsT().getTime());
                crmcustomerdetailsVop.setCreateDate(date);
                Time time=new Time(crmcustomerdetailsVop.getZsT().getTime());
                crmcustomerdetailsVop.setTime(time);
                crmcustomerdetailsVops.add(crmcustomerdetailsVop);

            }
        }
        SortClass sort = new SortClass();
        Collections.sort(crmcustomerdetailsVops, sort);
        return crmcustomerdetailsVops;
    }
    static class SortClass implements Comparator {

        @Override
        public int compare(Object obj0, Object obj1) {
            CrmcustomerdetailsVop map0 = (CrmcustomerdetailsVop) obj0;
            CrmcustomerdetailsVop map1 =(CrmcustomerdetailsVop) obj1;
            int flag =map0.getZsT().compareTo(map1.getZsT());
            return -flag; // 不取反，则按正序排列
        }
    }
}
