package com.crmdemo.dao;

import com.crmdemo.entity.Agencystaff;
import com.crmdemo.vop.AgencystaffVop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AgencystaffDao {
    List<Agencystaff> selectAgencystaffList(Agencystaff agencystaff);
    Integer selectAgencystaffCount(Agencystaff agencystaff);
    Integer insertAgencystaff(Agencystaff agencystaff);
    Integer updateAgencystaff(Agencystaff agencystaff);
    List<AgencystaffVop> selectAgencystaffListByCondition(Agencystaff agencystaff);
    Agencystaff selectAgencystaffById(@Param("id") Integer id);
}
