package com.crmdemo.service;

import com.crmdemo.entity.Crmagentsinfo;

import java.util.List;

public interface CrmagentsinfoService {
    boolean insertCrmagentsinfo(Crmagentsinfo crmagentsinfo);
    List<Crmagentsinfo> selectCrmagentsinfoList(Crmagentsinfo crmagentsinfo);
}
