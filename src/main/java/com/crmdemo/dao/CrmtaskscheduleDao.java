package com.crmdemo.dao;

import com.crmdemo.entity.Crmtaskschedule;
import com.crmdemo.vop.Crmtaskschedulevop;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CrmtaskscheduleDao {
    //查询任务跟进
    List<Crmtaskschedulevop> selectCrmtaskschedulevop();
    //增加
    Integer addCrmtaskschedule(Crmtaskschedule crmtaskschedule);
    //更新任务进度
    Integer updateCrmtaskschedule(Crmtaskschedule crmtaskschedule);
}


