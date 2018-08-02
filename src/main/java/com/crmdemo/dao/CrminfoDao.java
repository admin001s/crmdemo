package com.crmdemo.dao;

import com.crmdemo.entity.Crminfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrminfoDao {
    List<Crminfo> selectcrmByName(Crminfo crminfo);

    List<Crminfo> selectCrminfoList(Crminfo crminfo);
}
