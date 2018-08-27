package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.vop.CrmcustomersinfoVop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CrmcustomersinfoDao {
    Integer insertCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);

    //查询客户
    List<Crmcustomersinfo> selectcrmcustomersinfo(@Param("open") String open);

    List<CrmcustomersinfoVop> selectCrmcustomersinfoList(Crmcustomersinfo crmcustomersinfo);

    Integer selectCrmcustomersinfoCount(Crmcustomersinfo crmcustomersinfo);

    Integer updateCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);

    Crmcustomersinfo selectCrmcustomersinfoById(Crmcustomersinfo crmcustomersinfo);

    List<Crmcustomersinfo> selectCustomersByUser(Crmcustomersinfo crmcustomersinfo);

    List<Crmcustomersinfo> selectCrmcustomersinfos(Crmcustomersinfo crmcustomersinfo);

    List<Crmcustomersinfo> selectCrmcustomersinfosByUser(Crmcustomersinfo crmcustomersinfo);
}
