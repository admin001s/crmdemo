package com.crmdemo.service.impl;

import com.crmdemo.dao.AuditrecordDao;
import com.crmdemo.dao.CrmcustomerorderDao;
import com.crmdemo.dao.CrmcustomersinfoDao;
import com.crmdemo.entity.Auditrecord;
import com.crmdemo.entity.Crmcustomerorder;
import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrmcustomerorderService;
import com.crmdemo.vop.CrmcustomerorderVop;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.List;

@Service
public class CrmcustomerorderServiceImpl implements CrmcustomerorderService {
    @Resource
    CrmcustomerorderDao crmcustomerorderDao;
    @Resource
    AuditrecordDao auditrecordDao;
    @Resource
    CrmcustomersinfoDao crmcustomersinfoDao;

    @Override
    public boolean insertCrmcustomerorder(Crmcustomerorder crmcustomerorder) {
        try {
            if (crmcustomerorderDao.insertCrmcustomerorder(crmcustomerorder) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateCrmcustomerorder(Crmcustomerorder crmcustomerorder) {
        try {
            if (crmcustomerorderDao.updateCrmcustomerorder(crmcustomerorder) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public List<CrmcustomerorderVop> selectCrmcustomerorderVopList(CrmcustomerorderVop crmcustomerorderVop) {
        List<CrmcustomerorderVop> crmcustomerorderVops = null;
        try {
            crmcustomerorderVops = crmcustomerorderDao.selectCrmcustomerorderVopList(crmcustomerorderVop);
        } catch (Exception e) {

        }
        return crmcustomerorderVops;
    }

    @Override
    public boolean updateCrmcustomerorderStatus(Integer id, Integer status, Integer sp, Crminfo crminfo) {
        Crmcustomerorder crmcustomerorder = new Crmcustomerorder();
        crmcustomerorder.setId(id);
        crmcustomerorder.setSigningStatus(status);
        if (sp == 1) {
            crmcustomerorder.setReviewerId(crminfo.getUserId());
            crmcustomerorder.setReviewerLevel(crminfo.getUserArrangement());
            if (status == 3) {
                crmcustomerorder.setYesSigningTime(new Timestamp(System.currentTimeMillis()));
            }
        }
        try {
            if (crmcustomerorderDao.updateCrmcustomerorder(crmcustomerorder) > 0) {

            }else {
                throw new Exception();
            }
            if (sp == 1) {
                Auditrecord auditrecord = new Auditrecord();
                auditrecord.setOrderId(crmcustomerorder.getId());
                auditrecord.setCreatedate(new Timestamp(System.currentTimeMillis()));
                auditrecord.setUserId(crminfo.getUserId());
                auditrecord.setRecotdStatus(status);
                if(auditrecordDao.insertAuditrecord(auditrecord)>0){

                }else {
                    throw new Exception();
                }
                Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
                crmcustomersinfo.setId(crmcustomerorderDao.selectCrmcustomerorderById(id).getCustomersId());
                crmcustomersinfo.setCustomerStatus(3);
                if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) >0){

                }else {
                    throw new Exception();
                }
            }
            return true;
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateCrmcustomerordersStatus(String[] ids, Integer status, Integer sp, Crminfo crminfo) {
        try {
            for (String id : ids) {
                Crmcustomerorder crmcustomerorder = new Crmcustomerorder();
                crmcustomerorder.setId(Integer.parseInt(id));
                crmcustomerorder.setSigningStatus(status);
                if (sp == 1) {
                    crmcustomerorder.setReviewerId(crminfo.getUserId());
                    crmcustomerorder.setReviewerLevel(crminfo.getUserArrangement());
                    if (status == 3) {
                        crmcustomerorder.setYesSigningTime(new Timestamp(System.currentTimeMillis()));
                    }
                    Auditrecord auditrecord = new Auditrecord();
                    auditrecord.setOrderId(crmcustomerorder.getId());
                    auditrecord.setCreatedate(new Timestamp(System.currentTimeMillis()));
                    auditrecord.setUserId(crminfo.getUserId());
                    auditrecord.setRecotdStatus(status);
                    if(auditrecordDao.insertAuditrecord(auditrecord)>0){

                    }else {
                        throw new Exception();
                    }
                    Crmcustomersinfo crmcustomersinfo=new Crmcustomersinfo();
                    crmcustomersinfo.setId(crmcustomerorderDao.selectCrmcustomerorderById(Integer.parseInt(id)).getCustomersId());
                    crmcustomersinfo.setCustomerStatus(3);
                    if(crmcustomersinfoDao.updateCrmcustomersinfo(crmcustomersinfo) >0){

                    }else {
                        throw new Exception();
                    }
                }
                if (crmcustomerorderDao.updateCrmcustomerorder(crmcustomerorder) > 0) {

                } else {
                    throw new Exception();
                }
            }
            return true;
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean deleteCrmcustomerorder(Integer id) {
        Crmcustomerorder crmcustomerorder = new Crmcustomerorder();
        crmcustomerorder.setId(id);
        crmcustomerorder.setIsdelete(1);
        try {
            if (crmcustomerorderDao.updateCrmcustomerorder(crmcustomerorder) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public CrmcustomerorderVop selectCrmcustomerorderById(Integer id) {
        CrmcustomerorderVop crmcustomerorderVop = null;
        try {
            crmcustomerorderVop = crmcustomerorderDao.selectCrmcustomerorderById(id);
        } catch (Exception e) {

        }
        return crmcustomerorderVop;
    }

    @Override
    public List<Crmcustomerorder> selectCrmcustomerorderCount(Crmcustomerorder crmcustomerorder) {
        List<Crmcustomerorder> crmcustomerorders=null;
        try {
            crmcustomerorders=crmcustomerorderDao.selectCrmcustomerorderCount(crmcustomerorder);
        }catch (Exception e){

        }
        return crmcustomerorders;
    }
}
