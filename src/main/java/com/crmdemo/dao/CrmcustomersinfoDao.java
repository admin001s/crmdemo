package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomersinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmcustomersinfoDao {

    //查询客户
    List<Crmcustomersinfo> selectcrmcustomersinfo();
}
