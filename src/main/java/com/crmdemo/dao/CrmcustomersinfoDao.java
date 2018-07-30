package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomersinfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CrmcustomersinfoDao {
    Integer insertCrmcustomersinfo(Crmcustomersinfo crmcustomersinfo);
}
