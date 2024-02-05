package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.green.teamproject_groupware.dto.PBReply2DTO;
import com.green.teamproject_groupware.dto.PBReplyDTO;

public interface PBReplyDao {
    public ArrayList<PBReplyDTO> prlist(int pid);
    public void prwrite(PBReplyDTO dto);
    public void prmodify(PBReplyDTO dto);
    public void prdelete(PBReplyDTO dto);
    public List<PBReply2DTO> rprlist(Map<String, Object> params);
}