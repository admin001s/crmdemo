package com.crmdemo.dao;

import com.crmdemo.entity.Crmagentsinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmagentsinfoDao {
    Integer insertCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    List<Crmagentsinfo> selectCrmagentsinfoList(Crmagentsinfo crmagentsinfo);
    Integer updateCrmcustomersinfo(Crmagentsinfo crmagentsinfo);
    Integer selectCrmagentsinfoCount(Crmagentsinfo crmagentsinfo);

}
