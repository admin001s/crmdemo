package com.crmdemo.dao;

import com.crmdemo.entity.Areas;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface AreasDao {
    List<Areas> selectAreasListByCityid(Areas areas);
}
