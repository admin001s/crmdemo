package com.crmdemo.dao;

import com.crmdemo.entity.Crminfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CrminfoDao {
    List<Crminfo> selectcrmByName(Crminfo crminfo);

    List<Crminfo> selectCrminfoList(Crminfo crminfo);

    Integer selectCrminfoCount(Crminfo crminfo);

    Integer insertCrminfo(Crminfo crminfo);

    Integer selectMaxId();

    Integer updateCrminfo(Crminfo crminfo);

    Crminfo selectCrminfoById(@Param("userId") Integer userId);

    List<Crminfo> selectCrminfoByUser(Crminfo crminfo);
}
