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
    public List<Crmagentsinfo> selectCrmagentsinfoList(Crmagentsinfo crmagentsinfo) {
        List<Crmagentsinfo> crmagentsinfoList=null;
        try {
            crmagentsinfoList=crmagentsinfoDao.selectCrmagentsinfoList(crmagentsinfo);
        }catch (Exception e){

        }
        return crmagentsinfoList;
    }

    @Override
    public boolean insertCrmagentsinfo(Crmagentsinfo crmagentsinfo) {
        try {
            if(crmagentsinfoDao.insertCrmagentsinfo(crmagentsinfo)>0){
                return  true;
            }
        }catch (Exception e){

        }
        return false;
    }
}
