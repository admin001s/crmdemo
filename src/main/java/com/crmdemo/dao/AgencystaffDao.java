package com.crmdemo.dao;

import com.crmdemo.entity.Agencystaff;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AgencystaffDao {
    List<Agencystaff> selectAgencystaffList(Agencystaff agencystaff);
    Integer selectAgencystaffCount(Agencystaff agencystaff);
    Integer insertAgencystaff(Agencystaff agencystaff);
    Integer updateAgencystaff(Agencystaff agencystaff);
}
