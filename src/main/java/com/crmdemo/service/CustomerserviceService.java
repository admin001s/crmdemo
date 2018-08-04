package com.crmdemo.service;

import com.crmdemo.entity.Customerservice;

import java.util.List;

public interface CustomerserviceService {
    //查询客服
    List<Customerservice> selectcustomerservice(String name);
    //添加客服
    Integer Insertcustomerservice(String name);
    //删除客服
    Integer delcustomerservice(String id);
}
