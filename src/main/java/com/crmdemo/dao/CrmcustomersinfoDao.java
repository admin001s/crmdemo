package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomersinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface CrmcustomersinfoDao {
    Integer insertCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);
    //查询客户
    List<Crmcustomersinfo> selectcrmcustomersinfo();

    List<Crmcustomersinfo> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo);

    Integer selectCrmcustomersinfoCount(Crmcustomersinfo crmcustomersinfo);
}
