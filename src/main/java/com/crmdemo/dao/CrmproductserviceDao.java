package com.crmdemo.dao;

import com.crmdemo.entity.Crmproductservice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmproductserviceDao {
    //查询所有服务
    List<Crmproductservice> CRMPRODUCTSERVICE_LIST();
}
