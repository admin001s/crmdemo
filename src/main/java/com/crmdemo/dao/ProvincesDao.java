package com.crmdemo.dao;

import com.crmdemo.entity.Provinces;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ProvincesDao {
    List<Provinces> selectProvincesList();
    Provinces selectProvicesById(Provinces provinces);
}
