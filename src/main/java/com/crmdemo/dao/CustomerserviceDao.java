package com.crmdemo.dao;

import com.crmdemo.entity.Customerservice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CustomerserviceDao {
    //查询客服
    List<Customerservice> customerservicelist(@Param("name") String name);
    //添加客服
    Integer customerserviceAdd(@Param("name") String name);
    //删除客服
    Integer delcustomerservice(@Param("id") String id);

}
