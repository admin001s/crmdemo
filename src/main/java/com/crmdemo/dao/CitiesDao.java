package com.crmdemo.dao;

import com.crmdemo.entity.Cities;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface CitiesDao {
    List<Cities> selectCitiesListByProvinceid(Cities cities);
}
