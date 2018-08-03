package com.crmdemo.service.impl;

import com.crmdemo.dao.AgencystaffDao;
import com.crmdemo.entity.Agencystaff;
import com.crmdemo.service.AgencystaffService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AgencystaffServiceImpl implements AgencystaffService {
    @Resource
    AgencystaffDao agencystaffDao;

    @Override
    public Agencystaff selectAgencystaffById(Agencystaff agencystaff) {
        Agencystaff agencystaff1=null;
        Agencystaff agencystaff2=new Agencystaff();
        agencystaff2.setId(agencystaff.getId());
        try {
            agencystaff1=agencystaffDao.selectAgencystaffList(agencystaff2).get(0);
        }catch (Exception e){

        }
        return agencystaff1;
    }

    @Override
    public boolean deleteAgencystaff(Agencystaff agencystaff) {
        Agencystaff agencystaff1=new Agencystaff();
        agencystaff1.setId(agencystaff.getId());
        agencystaff1.setIsdelete(1);
        try {
            agencystaffDao.updateAgencystaff(agencystaff1);
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public List<Agencystaff> selectAgencystaffList(Agencystaff agencystaff) {
        List<Agencystaff> agencystaffList=null;
        try {
            agencystaffList=agencystaffDao.selectAgencystaffList(agencystaff);
        }catch (Exception e){

        }
        return agencystaffList;
    }

    @Override
    public boolean isrepeat(Agencystaff agencystaff) {
        try {
            if(agencystaffDao.selectAgencystaffCount(agencystaff)>0){
                return  false;
            }
        }catch (Exception e){

        }
        return true;
    }

    @Override
    public boolean insertAgencystaff(Agencystaff agencystaff) {
        try {
            if(agencystaffDao.insertAgencystaff(agencystaff)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public boolean updateAgencystaff(Agencystaff agencystaff) {
        try {
            if(agencystaffDao.updateAgencystaff(agencystaff)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
