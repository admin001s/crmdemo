package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmcustomerallocateDao;
import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.service.CrmcustomerallocateService;
import com.crmdemo.vop.CrmcustomerallocateVop;
import com.crmdemo.vop.CrmcustomerdetailsVop;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CrmcustomerallocateServiceImpl implements CrmcustomerallocateService {
    @Resource
    CrmcustomerallocateDao crmcustomerallocateDao;
    @Override
    public boolean insertCrmcustomerallocate(Crmcustomerallocate crmcustomerallocate) {
        try {
            if(crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public List<Crmcustomerallocate> selectCrmcustomerallocateList(Crmcustomerallocate crmcustomerallocate) {
        List<Crmcustomerallocate> crmcustomerallocates=null;
        try {
            crmcustomerallocates=crmcustomerallocateDao.selectCrmcustomerallocateList(crmcustomerallocate);
        }catch (Exception e){

        }
        return crmcustomerallocates;
    }

    @Override
    public List<CrmcustomerdetailsVop> selectFollowup(Integer id) {
        return null;
    }

    @Override
    public List<CrmcustomerallocateVop> selectCrmcustomerallByUserCount(CrmcustomerallocateVop crmcustomerallocateVop) {
        List<CrmcustomerallocateVop> crmcustomerallocateVops=null;
        try {
            crmcustomerallocateVops=crmcustomerallocateDao.selectCrmcustomerallByUserCount(crmcustomerallocateVop);
        }catch (Exception e){
            System.out.print("错误");
        }
        return crmcustomerallocateVops;
    }
}
