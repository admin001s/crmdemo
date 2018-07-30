package com.crmdemo.service.impl;

import com.crmdemo.dao.ProvincesDao;
import com.crmdemo.entity.Provinces;
import com.crmdemo.service.ProvincesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ProvincesServiceImpl implements ProvincesService {
    @Resource
    ProvincesDao provincesDao;
    @Override
    public List<Provinces> selectProList() {
        List<Provinces> provincesList=null;
        try {
            provincesList=provincesDao.selectProvincesList();
        }catch (Exception e){

        }
        return provincesList;
    }
}
