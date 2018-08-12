package com.crmdemo.service.impl;

import com.crmdemo.dao.AgencystaffDao;
import com.crmdemo.dao.CrmagentsinfoDao;
import com.crmdemo.dao.CrmcustomerallocateDao;
import com.crmdemo.dao.CrminfoDao;
import com.crmdemo.entity.Agencystaff;
import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.AgencystaffService;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.vop.AgencystaffVop;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;

@Service
public class AgencystaffServiceImpl implements AgencystaffService {
    @Resource
    AgencystaffDao agencystaffDao;
    @Resource
    CrmagentsinfoDao crmagentsinfoDao;
    @Resource
    CrminfoDao crminfoDao;
    @Resource
    CrmcustomerallocateDao crmcustomerallocateDao;

    @Override
    public List<AgencystaffVop> selectAgencystaffListByCondition(Agencystaff agencystaff) {
        List<AgencystaffVop> agencystaffVops = null;
        try {
            agencystaffVops = agencystaffDao.selectAgencystaffListByCondition(agencystaff);
        } catch (Exception e) {

        }
        return agencystaffVops;
    }

    @Override
    public Agencystaff selectAgencystaffById(Agencystaff agencystaff) {
        Agencystaff agencystaff1 = null;
        Agencystaff agencystaff2 = new Agencystaff();
        agencystaff2.setId(agencystaff.getId());
        try {
            agencystaff1 = agencystaffDao.selectAgencystaffList(agencystaff2).get(0);
        } catch (Exception e) {

        }
        return agencystaff1;
    }

    @Override
    public boolean deleteAgencystaff(Agencystaff agencystaff) {
        Agencystaff agencystaff1 = new Agencystaff();
        agencystaff1.setId(agencystaff.getId());
        agencystaff1.setIsdelete(1);
        try {
            agencystaffDao.updateAgencystaff(agencystaff1);
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public List<Agencystaff> selectAgencystaffList(Agencystaff agencystaff) {
        List<Agencystaff> agencystaffList = null;
        try {
            agencystaffList = agencystaffDao.selectAgencystaffList(agencystaff);
        } catch (Exception e) {

        }
        return agencystaffList;
    }

    @Override
    public boolean isrepeat(Agencystaff agencystaff) {
        try {
            if (agencystaffDao.selectAgencystaffCount(agencystaff) > 0) {
                return false;
            }
        } catch (Exception e) {

        }
        return true;
    }

    @Override
    public boolean insertAgencystaff(Agencystaff agencystaff) {
        try {
            if (agencystaffDao.insertAgencystaff(agencystaff) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateAgencystaff(Agencystaff agencystaff) {
        try {
            if (agencystaffDao.updateAgencystaff(agencystaff) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateAgentstaffTransfer(String[] id, String beiuserId) {
        try {
            Crmagentsinfo crmagentsinfo1 = new Crmagentsinfo();
            crmagentsinfo1.setAgentCharacterrelationship(beiuserId);
            int id1 = crmagentsinfoDao.selectCrmagentsinfoList(crmagentsinfo1).get(0).getId();
            for (String ids : id) {
                Agencystaff agencystaff = agencystaffDao.selectAgencystaffById(Integer.parseInt(ids));
                Agencystaff agencystaff2 = new Agencystaff();
                agencystaff2.setId(agencystaff.getId());
                Integer addid = CommonUtils.getUserId(beiuserId);
                agencystaff2.setAgentStaffRelationship(beiuserId.replace("/" + addid, ""));
                agencystaff2.setReviewerId(CommonUtils.getUserId(beiuserId.replace("/" + addid, "")));
                agencystaff2.setAgentStaffCharacterrelationship(beiuserId + "/" + CommonUtils.getUserId(agencystaff.getAgentStaffCharacterrelationship()));
                agencystaff2.setAgentStaffParentid(id1);
                if (agencystaffDao.updateAgencystaff(agencystaff2) < 0) {
                    throw new Exception();
                }
                Crminfo crminfo = new Crminfo();
                crminfo.setUserId(CommonUtils.getUserId(agencystaff.getAgentStaffCharacterrelationship()));
                crminfo.setUserArrangement(beiuserId + "/" + CommonUtils.getUserId(agencystaff.getAgentStaffCharacterrelationship()));
                if (crminfoDao.updateCrminfo(crminfo) < 0) {
                    throw new Exception();
                }
            }
            return true;
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean isSubordinateRepeat(Integer id) {
        Agencystaff agencystaff = agencystaffDao.selectAgencystaffById(id);
        Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
        crmcustomerallocate.setBeiuserId(CommonUtils.getUserId(agencystaff.getAgentStaffCharacterrelationship()));
        if (crmcustomerallocateDao.selectCrmcustomerallocateCount(crmcustomerallocate) > 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteAgentstaffAndTransfer(String id, String beiuserId, HttpServletResponse response, HttpServletRequest request) {
        try {
            Agencystaff agencystaff = agencystaffDao.selectAgencystaffById(Integer.parseInt(id));
            Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
            crmcustomerallocate.setBeiuserId(CommonUtils.getUserId(agencystaff.getAgentStaffCharacterrelationship()));
            crmcustomerallocate.setIsRelation(0);
            List<Crmcustomerallocate> crmcustomerallocates = crmcustomerallocateDao.selectCrmcustomerallocateList(crmcustomerallocate);
            for (Crmcustomerallocate crmcustomerallocate1 : crmcustomerallocates) {
                Crmcustomerallocate crmcustomerallocate2 = new Crmcustomerallocate();
                crmcustomerallocate2.setId(crmcustomerallocate1.getId());
                crmcustomerallocate2.setIsRelation(1);
                if (crmcustomerallocateDao.updateCrmcustomerallocate(crmcustomerallocate2) < 0) {
                    throw new NullPointerException();
                }
                crmcustomerallocate2.setId(null);
                crmcustomerallocate2.setIsRelation(0);
                crmcustomerallocate2.setBeiuserId(CommonUtils.getUserId(beiuserId));
                crmcustomerallocate2.setCustomerId(crmcustomerallocate1.getCustomerId());
                crmcustomerallocate2.setCreateTime(new Timestamp(System.currentTimeMillis()));
                crmcustomerallocate2.setDistributionTime(new Timestamp(System.currentTimeMillis()));
                crmcustomerallocate2.setUserId(CommonUtils.getUser(request,response).getUserId());
                if (crmcustomerallocateDao.insertCrmcustomerallocate(crmcustomerallocate2) < 0) {
                    throw new Exception();
                }
            }
            Agencystaff agencystaff1=new Agencystaff();
            agencystaff1.setId(Integer.parseInt(id));
            agencystaff1.setIsdelete(1);
            if(agencystaffDao.updateAgencystaff(agencystaff1)<0){
                throw new Exception();
            }
            Crminfo crminfo = new Crminfo();
            crminfo.setUserId(CommonUtils.getUserId(agencystaff.getAgentStaffCharacterrelationship()));
            crminfo.setIsavailable(1);
            if (crminfoDao.updateCrminfo(crminfo) < 0) {
                throw new Exception();
            }
            return true;
        } catch (Exception e) {

        }
        return false;
    }
}
