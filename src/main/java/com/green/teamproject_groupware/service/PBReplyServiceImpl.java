package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.green.teamproject_groupware.dao.PBReplyDao;
import com.green.teamproject_groupware.dto.PBReply2DTO;
import com.green.teamproject_groupware.dto.PBReplyDTO;

@Service
public class PBReplyServiceImpl implements PBReplyService{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<PBReplyDTO> prlist(int pid) {
        PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
        ArrayList<PBReplyDTO> prlist = dao.prlist(pid);
        
        for (PBReplyDTO reply : prlist) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("pid", pid);
            params.put("parentPrid", reply.getPrid());
            List<PBReply2DTO> rprlist = rprlist(params);
            reply.setRprlist(rprlist);
        }

        return prlist;
    }

    @Override
    public void prwrite(PBReplyDTO dto) {
        PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
        dao.prwrite(dto);
    }

    @Override
    public void prmodify(PBReplyDTO dto) {
        PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
        dao.prmodify(dto);
    }

    @Override
    public void prdelete(PBReplyDTO dto) {
        PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
        dao.prdelete(dto);
    }

    @Override
    public List<PBReply2DTO> rprlist(Map<String, Object> params) {
        PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
        return dao.rprlist(params);
    }
}
