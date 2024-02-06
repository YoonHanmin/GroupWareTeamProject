package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import com.green.teamproject_groupware.dto.PBReply2DTO;

public interface PBReply2Service {
    public ArrayList<PBReply2DTO> rprlist(int pid, int parentPrid);
    public void rprwrite(PBReply2DTO dto);
    public void rprmodify(PBReply2DTO dto);
    public void rprdelete(PBReply2DTO dto);
}
