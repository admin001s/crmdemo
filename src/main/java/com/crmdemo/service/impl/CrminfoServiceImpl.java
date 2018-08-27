package com.crmdemo.service.impl;

import com.crmdemo.dao.CrminfoDao;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.service.CrminfoService;
import com.crmdemo.util.CommonUtils;
import com.crmdemo.vop.UserClass;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CrminfoServiceImpl implements CrminfoService {


    @Resource
    CrminfoDao crminfoDao;

    @Override
    public boolean isrepeat(Crminfo crminfo) {
        try {
            if(crminfoDao.selectCrminfoCount(crminfo)>0){
                return  false;
            }
        }catch (Exception e){

        }
        return true;
    }

    @Override
    public boolean insertCrminfo(Crminfo crminfo) {
        try {
            crminfo.setPassWord(CommonUtils.getMD5(crminfo.getPassWord()));
            if(crminfoDao.insertCrminfo(crminfo)>0){
                return  true;
            }
        }catch (Exception e){
            System.out.print(e);
        }
        return false;
    }

    @Override
    public Integer selectMaxId() {
        Integer max=0;
        try {
            max=crminfoDao.selectMaxId();
        }catch (Exception e){

        }
        return max;
    }

    @Override
    public List<Crminfo> selectCrminfoList(Crminfo crminfo) {
        List<Crminfo> crminfoList=null;
        try {
            crminfoList=crminfoDao.selectCrminfoList(crminfo);
        }catch (Exception e){

        }
        return crminfoList;
    }

    @Override
    public Crminfo selectLogin(Crminfo crminfo) {
        Crminfo crminfo1=null;
        List<Crminfo> crminfoList=null;
        try {
            crminfoList=crminfoDao.selectcrmByName(crminfo);
            if(null !=crminfoList){
                crminfo1=crminfoList.get(0);
                if(CommonUtils.getMD5(crminfo.getPassWord()).equals(crminfo1.getPassWord())){
                    return crminfo1;
                }else {
                    crminfo1=new Crminfo();
                    crminfo1.setUserId(-1);
                }
            }
        }catch (Exception e){

        }
        return crminfo1;
    }

    @Override
    public Crminfo selectCrminfoById(Integer userId) {
        Crminfo crminfo=null;
        try {
            crminfo=crminfoDao.selectCrminfoById(userId);
        }catch (Exception e){

        }
        return crminfo;
    }

    @Override
    public List<UserClass> selectCrminfoByUser(Crminfo crminfo) {
        List<UserClass> userClasses=new ArrayList<>();
        List<Crminfo> crminfoList=null;
        UserClass userClass1=new UserClass();
        userClass1.setId(crminfo.getUserId());
        userClass1.setPid(0);
        userClass1.setName(crminfo.getChineseName());
        userClass1.setIcon("assets/newadd/img/diy/1_close.png");
        userClasses.add(userClass1);
        try {
            crminfoList=crminfoDao.selectCrminfoByUser(crminfo);
            for (Crminfo crminfo1:crminfoList){
                UserClass userClass=new UserClass();
                userClass.setId(crminfo1.getUserId());
                userClass.setPid(CommonUtils.getUserPid(crminfo1.getUserArrangement()));
                userClass.setName(crminfo1.getChineseName()+"("+crminfo1.getRoleName()+")");
                userClass.setIcon("assets/newadd/img/diy/1_open.png");
                userClasses.add(userClass);
            }
        }catch (Exception e){

        }
        return userClasses;
    }
}
