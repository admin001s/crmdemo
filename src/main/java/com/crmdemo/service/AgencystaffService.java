package com.crmdemo.service;

import com.crmdemo.entity.Agencystaff;
import com.crmdemo.vop.AgencystaffVop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface AgencystaffService {
    List<Agencystaff> selectAgencystaffList(Agencystaff agencystaff);
    boolean isrepeat(Agencystaff agencystaff);
    boolean insertAgencystaff(Agencystaff agencystaff);
    boolean updateAgencystaff(Agencystaff agencystaff);
    boolean deleteAgencystaff(Agencystaff agencystaff);
    Agencystaff selectAgencystaffById(Agencystaff agencystaff);
    List<AgencystaffVop> selectAgencystaffListByCondition(Agencystaff agencystaff);
    boolean updateAgentstaffTransfer(String[] id,String beiuserId);
    boolean isSubordinateRepeat(Integer id);
    boolean deleteAgentstaffAndTransfer(String id, String beiuserId, HttpServletResponse response, HttpServletRequest request);
}
