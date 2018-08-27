package com.crmdemo.service;

import com.crmdemo.entity.Crmcustomersinfo;
import com.crmdemo.entity.Crminfo;
import com.crmdemo.entity.Information;

import java.util.List;

public interface InformationService {
    boolean insertInformationEveryDay(List<Crmcustomersinfo> crmcustomersinfos, Crminfo crminfo);

    List<Information> selectInfomations(Information information);

    boolean updateInformation(Information information);

    boolean updateInformationByUser(Information information);
}
