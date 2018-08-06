package com.crmdemo.service;

import com.crmdemo.entity.Crmproductservice;

import java.util.List;

public interface CrmproductserviceService {
    //查询所有服务
    List<Crmproductservice> selectCrmproductservice(String id);
    //更新产品服务
    Integer updateCrmproductservice(Crmproductservice crmproductservice);
    //删除产品服务
    Integer delCrmproductservice(String id);
    //增加产品服务
    Integer addCrmproductservice(Crmproductservice crmproductservice);

}
