package com.crmdemo.service;

import com.crmdemo.entity.Openservice;
import com.crmdemo.vop.Openservicevop;


import java.util.List;

public interface OpenserviceService {
    //查询客户开通的服务
    List<Openservice> selectOpenservice(String crmcustomersinfoid);

    //客户开通的服务
    Integer insertOpenservice(Openservice openservice);
    //删除服务
    Integer deleteOpenservice(String crmcustomersinfoid);
    //查询所有开通服务的客户
    List<Openservicevop> selectALlOpen(String fen);
    //为客户添加服务人员
    Integer updateOpenservice(String customerservice,String id);
}

