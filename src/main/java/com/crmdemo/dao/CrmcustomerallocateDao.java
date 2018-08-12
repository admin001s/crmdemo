package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomerallocate;
import com.crmdemo.vop.CrmcustomerallocateVop;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmcustomerallocateDao {
    Integer insertCrmcustomerallocate(Crmcustomerallocate crmcustomerallocate);
    Integer selectCrmcustomerallocateCount(Crmcustomerallocate crmcustomerallocate);
    List<Crmcustomerallocate> selectCrmcustomerallocateList(Crmcustomerallocate crmcustomerallocate);
    Integer updateCrmcustomerallocate(Crmcustomerallocate crmcustomerallocate);
    List<CrmcustomerallocateVop> selectCrmcustomerallocateVop(Crmcustomerallocate crmcustomerallocate);
}
