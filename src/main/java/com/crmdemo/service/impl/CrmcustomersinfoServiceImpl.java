package com.crmdemo.service.impl;

import com.crmdemo.dao.*;
import com.crmdemo.entity.*;
import com.crmdemo.service.CrmcustomersinfoService;
import com.crmdemo.vop.CrmcustomersinfoVop;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
@Transactional
public class CrmcustomersinfoServiceImpl implements CrmcustomersinfoService {
    private Logger logger=Logger.getLogger(CrmcustomersinfoServiceImpl.class);
    @Resource
    CrmcustomersinfoDao crmcustomersinfoDao;
    @Resource
    ProvincesDao provincesDao;
    @Resource
    CitiesDao citiesDao;
    @Resource
    AreasDao areasDao;
    @Resource
    CrmcustomerallocateDao crmcustomerallocateDao;

    @Override
    public boolean deleteCrmcustomerssinfo(Integer id) {
        Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
        crmcustomersinfo.setI(id);
        crmcustomersinfo.setDeleteStatus(1);
        try {
            if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public Crmcustomersinfo selectCrmcustomersinfoById(Integer id) {
        Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
        crmcustomersinfo.setId(id);
        Crmcustomersinfo crmcustomersinfo1=null;
        try {
            crmcustomersinfo1=crmcustomersinfoDao.selectCrmcustomersinfoById(crmcustomersinfo);
        }catch (Exception e){

        }
        return crmcustomersinfo1;
    }

    @Override
    public boolean isrepeat(Crmcustomersinfo crmcustomersinfo) {
        try {
            if(crmcustomersinfoDao.selectCrmcustomersinfoCount(crmcustomersinfo)>0){
                return false;
            }
        }catch (Exception e){

        }
        return true;
    }

    @Override
    public List<CrmcustomersinfoVop> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo) {
        List<CrmcustomersinfoVop> crmcustomersinfoList=null;
        try {
            crmcustomersinfoList=crmcustomersinfoDao.selectCrmcustomersinfoList(crmcustomersinfo);
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        }catch (Exception e){
            logger.debug("do selectcrmcustomersinfo()------------------------------"+e.getMessage());
        }
        return crmcustomersinfoList;
    }

    @Override
    public boolean addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        Provinces provinces=new Provinces();
        provinces.setProvinceid(crmcustomersinfo.getProvinceName());
        Cities cities=new Cities();
        cities.setCityid(crmcustomersinfo.getCityName());
        Areas areas=new Areas();
        areas.setAreaid(crmcustomersinfo.getMainsalesarea());
        crmcustomersinfo.setProvinceName(provincesDao.selectProvicesById(provinces).getProvince());
        crmcustomersinfo.setCityName(citiesDao.selectCitiesByid(cities).getCity());
        crmcustomersinfo.setMainsalesarea(areasDao.selectAreasById(areas).getArea());
        try {
            if (crmcustomersinfoDao.insertCrmcustomersinfo(crmcustomersinfo) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }


    @Override
    public List<Crmcustomersinfo> selectcrmcustomersinfo(String open) {
        List<Crmcustomersinfo> crmcustomersinfoList=null;
        try {
            crmcustomersinfoList=crmcustomersinfoDao.selectcrmcustomersinfo(open);
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        }catch (Exception e){
            System.out.println("++++++++++++++++++++++++++++"+e.getMessage());
            logger.debug("do selectcrmcustomersinfo()------------------------------"+e.getMessage());
        }
        return crmcustomersinfoList;
    }

    /**
     * 为客户分配根据人员
     * @param crmcustomersinfo
     * @return
     */
    @Override
    public boolean updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo, Crmcustomerallocate crmcustomerallocate) {
        try {
            if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo)>0 && crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate)>0){
                return  true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public boolean updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        try {
            if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo)>0){
                return  true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
