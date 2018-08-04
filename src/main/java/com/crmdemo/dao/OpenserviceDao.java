package com.crmdemo.dao;

import com.crmdemo.entity.Openservice;
import com.crmdemo.vop.Openservicevop;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface OpenserviceDao {
    //查询客户开通的服务
    List<Openservice> OPENSERVICE(@Param("crmcustomersinfoid") String crmcustomersinfoid);

    //客户开通的服务
    Integer insertOpenservice(Openservice openservice);

    //删除服务
    Integer deleteOpenservice(@Param("crmcustomersinfoid") String crmcustomersinfoid);

    //查询所有开通服务的客户
    List<Openservicevop> selectALlOpen(@Param("fen") String fen);
    //为客户添加服务人员
    Integer updateOpenservice(@Param("customerservice")String customerservice,@Param("id") String id);
}
