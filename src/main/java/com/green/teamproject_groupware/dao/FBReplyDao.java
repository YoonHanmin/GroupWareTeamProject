package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.teamproject_groupware.dto.FBReply2DTO;
import com.green.teamproject_groupware.dto.FBReplyDTO;

public interface FBReplyDao {
    public ArrayList<FBReplyDTO> rlist(int bid);
    public void rwrite(FBReplyDTO dto);
    public void rmodify(FBReplyDTO dto);
    public void rdelete(FBReplyDTO dto);
    public List<FBReply2DTO> rrlist(Map<String, Object> params);
    public String getEmpnoByBid(HashMap<String, String>param);
    public int getNextRid();
}