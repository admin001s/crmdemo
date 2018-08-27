package com.crmdemo.service;

import com.crmdemo.vop.AuditrecordVop;

import java.util.List;

public interface AuditrecordService {
    List<AuditrecordVop> selectAuditrecordVops(AuditrecordVop auditrecordVop);
}
