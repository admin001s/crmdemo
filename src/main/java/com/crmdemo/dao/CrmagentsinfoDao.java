package com.crmdemo.dao;

import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.vop.CrmagentsinfoVop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CrmagentsinfoDao {
    Integer insertCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    List<Crmagentsinfo> selectCrmagentsinfoList(Crmagentsinfo crmagentsinfo);
    Integer updateCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    Integer selectCrmagentsinfoCount(Crmagentsinfo crmagentsinfo);
    List<CrmagentsinfoVop> selectCrmagentsinfoListByCondition(Crmagentsinfo crmagentsinfo);
    Crmagentsinfo selectCrmagentsinfoById(@Param("id") Integer id);
}
