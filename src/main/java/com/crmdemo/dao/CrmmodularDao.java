package com.crmdemo.dao;

import com.crmdemo.entity.Crmmodular;
import com.crmdemo.vop.Crmmodularvop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CrmmodularDao {
    //查询模块
    List<Crmmodularvop> selectcrmmodular(@Param("id") String id);
    //更新模块
    Integer updatecrmmodular(Crmmodular crmmodular);
    //删除模块
    Integer delcrmmodular(@Param("id") String id);
    //增加模块
    Integer addcrmmodular(Crmmodular crmmodular);
}
