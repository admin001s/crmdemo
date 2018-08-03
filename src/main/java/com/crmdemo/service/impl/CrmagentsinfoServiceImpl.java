package com.crmdemo.service.impl;

import com.crmdemo.dao.CrmagentsinfoDao;
import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.service.CrmagentsinfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CrmagentsinfoServiceImpl implements CrmagentsinfoService {
    @Resource
    CrmagentsinfoDao crmagentsinfoDao;

    @Override
    public boolean deleteCrmcustomersinfo(Crmagentsinfo crmagentsinfo) {
        Crmagentsinfo crmagentsinfo1=new Crmagentsinfo();
        crmagentsinfo1.setId(crmagentsinfo.getId());
        crmagentsinfo1.setIsdelete(1);
        try {
            if(crmagentsinfoDao.updateCrmcustomersinfo(crmagentsinfo1)>0){
                return true;
            }
        }catch (Exception e){

        }
        return false;
    }

    @Override
    public boolean isrepeat(Crmagentsinfo crmagentsinfo) {
        try {
            if(crmagentsinfoDao.selectCrmagentsinfoCount(crmagentsinfo)>0){
                return false;
            }
        }catch (Exception e){

        }
        return true;
    }

    @Override
    public boolean updateCrmcustomersinfo(Crmagentsinfo crmagentsinfo) {
        try {
            if (crmagentsinfoDao.updateCrmcustomersinfo(crmagentsinfo) > 0) {
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
}
