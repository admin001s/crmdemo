package com.crmdemo.service;

import com.crmdemo.entity.Crmtaskschedule;
import com.crmdemo.vop.Crmtaskschedulevop;

import java.util.List;

public interface CrmtaskscheduleService {
    //查询任务跟进
    List<Crmtaskschedulevop> selectCrmtaskschedulevop();
    //增加
    Integer addCrmtaskschedule(Crmtaskschedule crmtaskschedule);
    //更新任务进度
    Integer updateCrmtaskschedule(Crmtaskschedule crmtaskschedule);
}
