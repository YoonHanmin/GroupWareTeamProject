package com.green.teamproject_groupware.dao;

import java.util.ArrayList;

import com.green.teamproject_groupware.dto.FBReply2DTO;

public interface FBReply2Dao {
    public ArrayList<FBReply2DTO> rrlist(int bid, int parentrid);
    public void rrwrite(FBReply2DTO dto);
    public void rrmodify(FBReply2DTO dto);
    public void rrdelete(FBReply2DTO dto);
}