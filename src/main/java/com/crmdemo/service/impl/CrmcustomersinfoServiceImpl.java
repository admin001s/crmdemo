package com.crmdemo.service.impl;

import com.crmdemo.dao.*;
import com.crmdemo.entity.*;
import com.crmdemo.service.CrmcustomersinfoService;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.vop.CrmcustomersinfoVop;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional
public class CrmcustomersinfoServiceImpl implements CrmcustomersinfoService {
    private Logger logger = Logger.getLogger(CrmcustomersinfoServiceImpl.class);
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
        Crmcustomersinfo crmcustomersinfo = new Crmcustomersinfo();
        crmcustomersinfo.setI(id);
        crmcustomersinfo.setDeleteStatus(1);
        try {
            if (crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public Crmcustomersinfo selectCrmcustomersinfoById(Integer id) {
        Crmcustomersinfo crmcustomersinfo = new Crmcustomersinfo();
        crmcustomersinfo.setId(id);
        Crmcustomersinfo crmcustomersinfo1 = null;
        try {
            crmcustomersinfo1 = crmcustomersinfoDao.selectCrmcustomersinfoById(crmcustomersinfo);
        } catch (Exception e) {

        }
        return crmcustomersinfo1;
    }

    @Override
    public boolean isrepeat(Crmcustomersinfo crmcustomersinfo) {
        try {
            if (crmcustomersinfoDao.selectCrmcustomersinfoCount(crmcustomersinfo) > 0) {
                return false;
            }
        } catch (Exception e) {

        }
        return true;
    }

    @Override
    public List<CrmcustomersinfoVop> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo) {
        List<CrmcustomersinfoVop> crmcustomersinfoList = null;
        try {
            crmcustomersinfoList = crmcustomersinfoDao.selectCrmcustomersinfoList(crmcustomersinfo);
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        } catch (Exception e) {
            logger.debug("do selectcrmcustomersinfo()------------------------------" + e.getMessage());
        }
        return crmcustomersinfoList;
    }

    @Override
    public boolean addCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        Provinces provinces = new Provinces();
        provinces.setProvinceid(crmcustomersinfo.getProvinceName());
        Cities cities = new Cities();
        cities.setCityid(crmcustomersinfo.getCityName());
        Areas areas = new Areas();
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
        List<Crmcustomersinfo> crmcustomersinfoList = null;
        try {
            crmcustomersinfoList = crmcustomersinfoDao.selectcrmcustomersinfo(open);
            logger.debug("do selectcrmcustomersinfo()------------------------------");
        } catch (Exception e) {
            System.out.println("++++++++++++++++++++++++++++" + e.getMessage());
            logger.debug("do selectcrmcustomersinfo()------------------------------" + e.getMessage());
        }
        return crmcustomersinfoList;
    }

    /**
     * 为客户分配根据人员
     *
     * @param crmcustomersinfo
     * @return
     */
    @Override
    public boolean updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo, Crmcustomerallocate crmcustomerallocate) {
        try {

            if (crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) > 0 && crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo) {
        try {
            if (CommonUtils.isStr2Num(crmcustomersinfo.getProvinceName())) {
                Provinces provinces = new Provinces();
                provinces.setProvinceid(crmcustomersinfo.getProvinceName());
                crmcustomersinfo.setProvinceName(provincesDao.selectProvicesById(provinces).getProvince());
            }else{
                crmcustomersinfo.setProvinceName(null);
            }
            if (CommonUtils.isStr2Num(crmcustomersinfo.getCityName())) {
                Cities cities = new Cities();
                cities.setCityid(crmcustomersinfo.getCityName());
                crmcustomersinfo.setCityName(citiesDao.selectCitiesByid(cities).getCity());
            }else{
                crmcustomersinfo.setCityName(null);
            }
            if (CommonUtils.isStr2Num(crmcustomersinfo.getMainsalesarea())) {
                Areas areas = new Areas();
                areas.setAreaid(crmcustomersinfo.getMainsalesarea());
                crmcustomersinfo.setMainsalesarea(areasDao.selectAreasById(areas).getArea());
            }else{
                crmcustomersinfo.setMainsalesarea(null);
            }
            if (crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateCustomersTransfer(String[] ids, String beiuserId, HttpServletRequest request, HttpServletResponse response) {
        try {
            for (String id : ids) {
                Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
                crmcustomerallocate.setCustomerId(Integer.parseInt(id));
                crmcustomerallocate.setIsRelation(0);
                List<Crmcustomerallocate> crmcustomerallocatelist = crmcustomerallocateDao.selectCrmcustomerallocateList(crmcustomerallocate);
                if (crmcustomerallocatelist.size() > 0) {
                    Crmcustomerallocate crmcustomerallocate1 = crmcustomerallocatelist.get(0);
                    Crmcustomerallocate crmcustomerallocate2 = new Crmcustomerallocate();
                    crmcustomerallocate2.setId(crmcustomerallocate1.getId());
                    crmcustomerallocate2.setId(crmcustomerallocate1.getId());
                    crmcustomerallocate2.setIsRelation(1);
                    if (crmcustomerallocateDao.updateCrmcustomerallocate(crmcustomerallocate2) < 0) {
                        throw new Exception();
                    }
                    crmcustomerallocate2.setId(null);
                    crmcustomerallocate2.setIsRelation(0);
                    crmcustomerallocate2.setBeiuserId(CommonUtils.getUserId(beiuserId));
                    crmcustomerallocate2.setCustomerId(crmcustomerallocate1.getCustomerId());
                    crmcustomerallocate2.setCreateTime(new Timestamp(System.currentTimeMillis()));
                    crmcustomerallocate2.setDistributionTime(new Timestamp(System.currentTimeMillis()));
                    crmcustomerallocate2.setUserId(CommonUtils.getUser(request, response).getUserId());
                    if (crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate2) < 0) {
                        throw new Exception();
                    }
                } else {
                    Crmcustomerallocate crmcustomerallocate2 = new Crmcustomerallocate();
                    crmcustomerallocate2.setUserId(CommonUtils.getUser(request, response).getUserId());
                    crmcustomerallocate2.setBeiuserId(CommonUtils.getUserId(beiuserId));
                    crmcustomerallocate2.setCustomerId(Integer.parseInt(id));
                    crmcustomerallocate2.setIsRelation(0);
                    crmcustomerallocate2.setCreateTime(new Timestamp(System.currentTimeMillis()));
                    crmcustomerallocate2.setDistributionTime(new Timestamp(System.currentTimeMillis()));
                    if (crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate2) < 0) {
                        throw new Exception();
                    }
                    Crmcustomersinfo crmcustomersinfo = new Crmcustomersinfo();
                    crmcustomersinfo.setId(Integer.parseInt(id));
                    crmcustomersinfo.setCustomerStatus(2);
                    if (crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) < 0) {
                        throw new Exception();
                    }
                }
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean rotationCustomers(String[] ids, String beiuserId, HttpServletRequest request, HttpServletResponse response) {
        try {
            for (String id : ids) {
                Crmcustomerallocate crmcustomerallocate2 = new Crmcustomerallocate();
                crmcustomerallocate2.setUserId(CommonUtils.getUser(request, response).getUserId());
                crmcustomerallocate2.setBeiuserId(CommonUtils.getUserId(beiuserId));
                crmcustomerallocate2.setCustomerId(Integer.parseInt(id));
                crmcustomerallocate2.setIsRelation(0);
                crmcustomerallocate2.setCreateTime(new Timestamp(System.currentTimeMillis()));
                crmcustomerallocate2.setDistributionTime(new Timestamp(System.currentTimeMillis()));
                if (crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate2) < 0) {
                    throw new Exception();
                }
                Crmcustomersinfo crmcustomersinfo = new Crmcustomersinfo();
                crmcustomersinfo.setId(Integer.parseInt(id));
                crmcustomersinfo.setCustomerStatus(2);
                if (crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) < 0) {
                    throw new Exception();
                }
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public List<Crmcustomersinfo> selectCustomersByUser(Crmcustomersinfo crmcustomersinfo) {
        List<Crmcustomersinfo> crmcustomersinfos=null;
        try {
            crmcustomersinfos=crmcustomersinfoDao.selectCustomersByUser(crmcustomersinfo);
        }catch (Exception e){

        }
        return crmcustomersinfos;
    }

    @Override
    public boolean updateCustomersBeOverdue(String[] ids, Crmcustomersinfo crmcustomersinfo) {
        try {
            for (String id : ids) {
                crmcustomersinfo.setId(Integer.parseInt(id));
                if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo)>0){

                }else {
                    throw  new Exception();
                }
            }
            return  true;
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public List<Crmcustomersinfo> selectCrmcustomersinfosByUser(Crmcustomersinfo crmcustomersinfo) {
        List<Crmcustomersinfo> crmcustomersinfos=null;
        try {
            crmcustomersinfos=crmcustomersinfoDao.selectCrmcustomersinfosByUser(crmcustomersinfo);
        }catch (Exception e){

        }
        return crmcustomersinfos;
    }
}
