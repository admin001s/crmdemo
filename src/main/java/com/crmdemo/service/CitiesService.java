package com.crmdemo.service;

import com.crmdemo.entity.Cities;

import java.util.List;

public interface CitiesService {
    List<Cities> selectCitiesList(Cities cities);
}
