package com.crmdemo.service.impl;

import com.crmdemo.dao.AreasDao;
import com.crmdemo.entity.Areas;
import com.crmdemo.service.AreasService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AreasServiceImpl implements AreasService {
    @Resource
    AreasDao areasDao;
    @Override
    public List<Areas> selectAreasList(Areas areas) {
        List<Areas> areasList=null;
        try {
            areasList=areasDao.selectAreasListByCityid(areas);
        }catch (Exception e){

        }
        return areasList;
    }
}
