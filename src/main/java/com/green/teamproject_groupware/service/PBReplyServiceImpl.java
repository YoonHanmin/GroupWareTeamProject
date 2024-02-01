package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.green.teamproject_groupware.dao.PBReplyDao;
import com.green.teamproject_groupware.dto.PBReplyDTO;

@Service
public class PBReplyServiceImpl implements PBReplyService{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<PBReplyDTO> prlist(int pid) {
        PBReplyDao dao = sqlSession.getMapper(PBReplyDao.class);
        ArrayList<PBReplyDTO> prlist = dao.prlist(pid);
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
}
