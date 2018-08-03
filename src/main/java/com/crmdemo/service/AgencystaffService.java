package com.crmdemo.service;

import com.crmdemo.entity.Agencystaff;

import java.util.List;

public interface AgencystaffService {
    List<Agencystaff> selectAgencystaffList(Agencystaff agencystaff);
    boolean isrepeat(Agencystaff agencystaff);
    boolean insertAgencystaff(Agencystaff agencystaff);
    boolean updateAgencystaff(Agencystaff agencystaff);
    boolean deleteAgencystaff(Agencystaff agencystaff);
}
