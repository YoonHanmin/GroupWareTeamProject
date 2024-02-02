package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import com.green.teamproject_groupware.dto.PBReplyDTO;

public interface PBReplyService {
    public ArrayList<PBReplyDTO> prlist(int pid);
    public void prwrite(PBReplyDTO dto);
    public void prmodify(PBReplyDTO dto);
    public void prdelete(PBReplyDTO dto);
}
