package com.crmdemo.dao;

import com.crmdemo.entity.Auditrecord;
import com.crmdemo.vop.AuditrecordVop;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AuditrecordDao {
    Integer insertAuditrecord(Auditrecord auditrecord);

    List<AuditrecordVop> selectAuditrecordVops(AuditrecordVop auditrecordVop);
}
