package com.crmdemo.service;
import com.crmdemo.entity.*;

import java.util.List;

public interface CrminfoService {
    Crminfo selectLogin(Crminfo crminfo);

    List<Crminfo> selectCrminfoList(Crminfo crminfo);

    boolean isrepeat(Crminfo crminfo);

    boolean insertCrminfo(Crminfo crminfo);

    Integer selectMaxId();

    Crminfo selectCrminfoById(Integer userId);
}
