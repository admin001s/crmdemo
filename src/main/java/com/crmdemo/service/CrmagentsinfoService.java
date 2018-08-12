package com.crmdemo.service;

import com.crmdemo.entity.Crmagentsinfo;
import com.crmdemo.vop.CrmagentsinfoVop;
import net.coobird.thumbnailator.filters.Rotation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface CrmagentsinfoService {
    boolean insertCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    List<Crmagentsinfo> selectCrmagentsinfoList(Crmagentsinfo crmagentsinfo);
    boolean updateCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    boolean isrepeat(Crmagentsinfo crmagentsinfo);
    boolean deleteCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    List<CrmagentsinfoVop> selectCrmagentsinfoListByCondition(Crmagentsinfo crmagentsinfo);
    boolean updateAgentsTransfer(String[] id,String beiuserId);
    boolean isSubordinateRepeat(Integer id);
    boolean deleteCrmagentsinfoAndTransfer(String id, String beiuserId, HttpServletResponse response, HttpServletRequest request);

}
