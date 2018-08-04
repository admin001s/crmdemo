package com.crmdemo.dao;

import com.crmdemo.entity.Crmproductservice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CrmproductserviceDao {
    //查询产品服务
    List<Crmproductservice> CRMPRODUCTSERVICE_LIST(@Param("id") String id);
    //更新产品服务
    Integer updateCrmproductservice(Crmproductservice crmproductservice);
    //删除产品服务
    Integer delCrmproductservice(@Param("id") String id);
    //增加产品服务
    Integer addCrmproductservice(Crmproductservice crmproductservice);
}
