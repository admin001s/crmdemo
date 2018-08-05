package com.crmdemo.service;

import com.crmdemo.dao.CrmmodularDao;
import com.crmdemo.entity.Crmmodular;
import com.crmdemo.vop.Crmmodularvop;

import java.util.List;

public interface CrmmodularService {

    //查询模块
    List<Crmmodularvop> selectcrmmodular(String id);
    //更新模块
    Integer updatecrmmodular(Crmmodular crmmodular);
    //删除模块
    Integer delcrmmodular( String id);
    //增加模块
    Integer addcrmmodular(Crmmodular crmmodular);
}
