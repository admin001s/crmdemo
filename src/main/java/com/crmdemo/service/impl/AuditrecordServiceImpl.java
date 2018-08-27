package com.crmdemo.service.impl;

import com.crmdemo.dao.AuditrecordDao;
import com.crmdemo.service.AuditrecordService;
import com.crmdemo.vop.AuditrecordVop;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AuditrecordServiceImpl implements AuditrecordService {
    @Resource
    AuditrecordDao auditrecordDao;
    @Override
    public List<AuditrecordVop> selectAuditrecordVops(AuditrecordVop auditrecordVop) {
        List<AuditrecordVop> auditrecordVops=null;
        try {
            auditrecordVops=auditrecordDao.selectAuditrecordVops(auditrecordVop);
        }catch (Exception e){

        }
        return auditrecordVops;
    }
}
