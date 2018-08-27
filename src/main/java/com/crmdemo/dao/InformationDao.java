package com.crmdemo.dao;

import com.crmdemo.entity.Information;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InformationDao {
    Integer insertInformation(Information information);

    List<Information> selectInfomations(Information information);

    Integer updateInformation(Information information);

    Integer updateInformationByUser(Information information);
}
