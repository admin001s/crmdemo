package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomerdetails;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CrmcustomerdetailsDao {
    Integer insertCrmcustomerdetails(Crmcustomerdetails crmcustomerdetails);
}
