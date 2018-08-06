package com.crmdemo.dao;

import com.crmdemo.entity.Crmcustomerallocate;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CrmcustomerallocateDao {
    Integer insertCrmcustomerallocate(Crmcustomerallocate crmcustomerallocate);
}
