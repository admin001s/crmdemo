package com.crmdemo.service.impl;

import com.crmdemo.dao.AgencystaffDao;
import com.crmdemo.dao.CrmagentsinfoDao;
import com.crmdemo.dao.CrmcustomerallocateDao;
import com.crmdemo.dao.CrminfoDao;
import com.crmdemo.entity.*;
import com.crmdemo.service.CrmagentsinfoService;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.vop.CrmagentsinfoVop;
import com.sun.mail.imap.protocol.ID;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional
public class CrmagentsinfoServiceImpl implements CrmagentsinfoService {
    @Resource
    CrmagentsinfoDao crmagentsinfoDao;
    @Resource
    AgencystaffDao agencystaffDao;
    @Resource
    CrminfoDao crminfoDao;
    @Resource
    CrmcustomerallocateDao crmcustomerallocateDao;

    @Override
    public List<CrmagentsinfoVop> selectCrmagentsinfoListByCondition(Crmagentsinfo crmagentsinfo) {
        List<CrmagentsinfoVop> crmagentsinfoVops = null;
        try {
            crmagentsinfoVops = crmagentsinfoDao.selectCrmagentsinfoListByCondition(crmagentsinfo);
        } catch (Exception e) {

        }
        return crmagentsinfoVops;
    }

    @Override
    public boolean deleteCrmagentsinfo(Crmagentsinfo crmagentsinfo) {
        Crmagentsinfo crmagentsinfo1 = crmagentsinfoDao.selectCrmagentsinfoById(crmagentsinfo.getId());
        Crmagentsinfo crmagentsinfo2 = new Crmagentsinfo();
        crmagentsinfo2.setId(crmagentsinfo.getId());
        crmagentsinfo2.setIsdelete(1);
        try {
            if (crmagentsinfoDao.updateCrmagentsinfo(crmagentsinfo2) > 0) {
                Crminfo crminfo = new Crminfo();
                crminfo.setUserId(CommonUtils.getUserId(crmagentsinfo1.getAgentCharacterrelationship()));
                crminfo.setIsavailable(1);
                if (crminfoDao.updateCrminfo(crminfo) > 0) {
                    return true;
                } else {
                    throw new Exception();
                }
            } else {
                throw new Exception();
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean isrepeat(Crmagentsinfo crmagentsinfo) {
        try {
            if (crmagentsinfoDao.selectCrmagentsinfoCount(crmagentsinfo) > 0) {
                return false;
            }
        } catch (Exception e) {

        }
        return true;
    }

    @Override
    public boolean updateCrmagentsinfo(Crmagentsinfo crmagentsinfo) {
        try {
            if (crmagentsinfoDao.updateCrmagentsinfo(crmagentsinfo) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public List<Crmagentsinfo> selectCrmagentsinfoList(Crmagentsinfo crmagentsinfo) {
        List<Crmagentsinfo> crmagentsinfoList = null;
        try {
            crmagentsinfoList = crmagentsinfoDao.selectCrmagentsinfoList(crmagentsinfo);
        } catch (Exception e) {

        }
        return crmagentsinfoList;
    }

    @Override
    public boolean insertCrmagentsinfo(Crmagentsinfo crmagentsinfo) {
        try {
            if (crmagentsinfoDao.insertCrmagentsinfo(crmagentsinfo) > 0) {
                return true;
            }
        } catch (Exception e) {

        }
        return false;
    }

    @Override
    public boolean updateAgentsTransfer(String[] id, String beiuserId) {
        try {
            Integer reviewerId = CommonUtils.getUserId(beiuserId);
            for (String ids : id) {
                Crmagentsinfo crmagentsinfo = crmagentsinfoDao.selectCrmagentsinfoById(Integer.parseInt(ids));
                Integer addId = CommonUtils.getUserId(crmagentsinfo.getAgentCharacterrelationship());
                String fpr = beiuserId + "/" + addId;
                Agencystaff agencystaff = new Agencystaff();
                agencystaff.setAgentStaffCharacterrelationship(crmagentsinfo.getAgentCharacterrelationship());
                List<Agencystaff> agencystaffList = agencystaffDao.selectAgencystaffList(agencystaff);
                for (Agencystaff agencystaff1 : agencystaffList) {
                    Agencystaff agencystaff2 = new Agencystaff();
                    agencystaff2.setId(agencystaff1.getId());
                    agencystaff2.setAgentStaffRelationship(beiuserId);
                    agencystaff2.setReviewerId(reviewerId);
                    agencystaff2.setAgentStaffCharacterrelationship(fpr + '/' + CommonUtils.getUserId(agencystaff1.getAgentStaffCharacterrelationship()));
                    if (agencystaffDao.updateAgencystaff(agencystaff2) < 0) {
                        throw new Exception();
                    }
                    Crminfo crminfo = new Crminfo();
                    crminfo.setUserId(CommonUtils.getUserId(agencystaff1.getAgentStaffCharacterrelationship()));
                    crminfo.setUserArrangement(fpr + '/' + CommonUtils.getUserId(agencystaff1.getAgentStaffCharacterrelationship()));
                    if (crminfoDao.updateCrminfo(crminfo) < 0) {
                        throw new Exception();
                    }
                }
                Crmagentsinfo crmagentsinfo1 = new Crmagentsinfo();
                crmagentsinfo1.setId(Integer.parseInt(ids));
                crmagentsinfo1.setAgentRelationship(beiuserId);
                crmagentsinfo1.setReviewerId(reviewerId);
                crmagentsinfo1.setAgentCharacterrelationship(fpr);
                if (crmagentsinfoDao.updateCrmagentsinfo(crmagentsinfo1) < 0) {
                    throw new Exception();
                }
                Crminfo crminfo = new Crminfo();
                crminfo.setUserId(addId);
                crminfo.setUserArrangement(fpr);
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
        Crmagentsinfo crmagentsinfo = crmagentsinfoDao.selectCrmagentsinfoById(id);
        Agencystaff agencystaff = new Agencystaff();
        agencystaff.setAgentStaffCharacterrelationship(crmagentsinfo.getAgentCharacterrelationship());
        if (agencystaffDao.selectAgencystaffCount(agencystaff) > 0) {
            return false;
        }
        Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
        crmcustomerallocate.setBeiuserId(CommonUtils.getUserId(crmagentsinfo.getAgentCharacterrelationship()));
        if (crmcustomerallocateDao.selectCrmcustomerallocateCount(crmcustomerallocate) > 0) {
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteCrmagentsinfoAndTransfer(String id, String beiuserId, HttpServletResponse response, HttpServletRequest request) {
        try {
            Crmagentsinfo crmagentsinfo = crmagentsinfoDao.selectCrmagentsinfoById(Integer.parseInt(id));
            Agencystaff agencystaff = new Agencystaff();
            agencystaff.setAgentStaffCharacterrelationship(crmagentsinfo.getAgentCharacterrelationship());
            Crmagentsinfo crmagentsinfo1=new Crmagentsinfo();
            crmagentsinfo1.setAgentCharacterrelationship(beiuserId);
            int id1=crmagentsinfoDao.selectCrmagentsinfoList(crmagentsinfo1).get(0).getId();
            List<Agencystaff> agencystaffList = agencystaffDao.selectAgencystaffList(agencystaff);
            for (Agencystaff agencystaff1 : agencystaffList) {
                Agencystaff agencystaff2 = new Agencystaff();
                agencystaff2.setId(agencystaff1.getId());
                Integer addid = CommonUtils.getUserId(beiuserId);
                agencystaff2.setAgentStaffRelationship(beiuserId.replace("/" + addid, ""));
                agencystaff2.setReviewerId(CommonUtils.getUserId(beiuserId.replace("/" + addid, "")));
                agencystaff2.setAgentStaffCharacterrelationship(beiuserId + "/" + CommonUtils.getUserId(agencystaff1.getAgentStaffCharacterrelationship()));
                agencystaff2.setAgentStaffParentid(id1);
                if (agencystaffDao.updateAgencystaff(agencystaff2) < 0) {
                    throw new Exception();
                }
                Crminfo crminfo = new Crminfo();
                crminfo.setUserId(CommonUtils.getUserId(agencystaff1.getAgentStaffCharacterrelationship()));
                crminfo.setUserArrangement(beiuserId + "/" + CommonUtils.getUserId(agencystaff1.getAgentStaffCharacterrelationship()));
                if (crminfoDao.updateCrminfo(crminfo) < 0) {
                    throw new Exception();
                }
            }
            Crmcustomerallocate crmcustomerallocate = new Crmcustomerallocate();
            crmcustomerallocate.setBeiuserId(CommonUtils.getUserId(crmagentsinfo.getAgentCharacterrelationship()));
            crmcustomerallocate.setIsRelation(0);
            List<Crmcustomerallocate> crmcustomerallocates = crmcustomerallocateDao.selectCrmcustomerallocateList(crmcustomerallocate);
            for (Crmcustomerallocate crmcustomerallocate1 : crmcustomerallocates) {
                Crmcustomerallocate crmcustomerallocate2 = new Crmcustomerallocate();
                crmcustomerallocate2.setId(crmcustomerallocate1.getId());
                crmcustomerallocate2.setIsRelation(1);
                if(crmcustomerallocateDao.updateCrmcustomerallocate(crmcustomerallocate2)<0){
                    throw new Exception();
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
            Crmagentsinfo crmagentsinfo3 = new Crmagentsinfo();
            crmagentsinfo3.setId(Integer.parseInt(id));
            crmagentsinfo3.setIsdelete(1);
            if (crmagentsinfoDao.updateCrmagentsinfo(crmagentsinfo3) < 0) {
                throw new Exception();
            }
            Crminfo crminfo = new Crminfo();
            crminfo.setUserId(CommonUtils.getUserId(crmagentsinfo.getAgentCharacterrelationship()));
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
