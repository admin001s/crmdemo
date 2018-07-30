package com.crmdemo.service.impl;

import com.crmdemo.dao.CitiesDao;
import com.crmdemo.entity.Cities;
import com.crmdemo.service.CitiesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CitiesServiceImpl implements CitiesService {
    @Resource
    CitiesDao citiesDao;

    @Override
    public List<Cities> selectCitiesList(Cities cities) {
        List<Cities> citiesList=null;
        try {
            citiesList=citiesDao.selectCitiesListByProvinceid(cities);
        }catch (Exception e){

        }
        return citiesList;
    }
}
