package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomerdetails;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.vop.CrmcustomerdetailsVop;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmcustomerdetailsDao {
    Integer insertCrmcustomerdetails(Crmcustomerdetails crmcustomerdetails);
    List<CrmcustomerdetailsVop> selectcrmcustomerdetailsVopList(Crminfo crminfo);
}
