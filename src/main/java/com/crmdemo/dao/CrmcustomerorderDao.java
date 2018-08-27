package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomerorder;
import com.crmdemo.vop.CrmcustomerorderVop;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmcustomerorderDao {
    Integer insertCrmcustomerorder(Crmcustomerorder crmcustomerorder);

    Integer updateCrmcustomerorder(Crmcustomerorder crmcustomerorder);

    List<CrmcustomerorderVop> selectCrmcustomerorderVopList(CrmcustomerorderVop crmcustomerorderVop);

    CrmcustomerorderVop selectCrmcustomerorderById(Integer id);

    List<Crmcustomerorder> selectCrmcustomerorderCount(Crmcustomerorder crmcustomerorder);

    List<Crmcustomerorder> selectcrmcustomerByUserCount(CrmcustomerorderVop crmcustomerorderVop);
}
