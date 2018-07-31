package com.crmdemo.service;

import com.crmdemo.entity.Openservice;


import java.util.List;

public interface OpenserviceService {
    //查询客户开通的服务
    Openservice selectOpenservice(String crmcustomersinfoid);

    //客户开通的服务
    Integer insertOpenservice(Openservice openservice);
    //删除服务
    Integer deleteOpenservice(String crmcustomersinfoid);
}

