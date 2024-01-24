package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.teamproject_groupware.dao.FBDao;
import com.green.teamproject_groupware.dao.NoticeDao;
import com.green.teamproject_groupware.dto.FBDto;
import com.green.teamproject_groupware.dto.NoticeCriteria;
import com.green.teamproject_groupware.dto.NoticeDto;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service("NoticeService")
public class NoticeSeviceImpl implements NoticeService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<NoticeDto> notice_list() {
		 log.info("@# NoticeSeviceImpl.list() start");
		 
		 NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		 
		 ArrayList<NoticeDto> nlist = dao.notice_list();
		 
		 log.info("@# NoticeSeviceImpl.list() end");
		 
		return nlist;
	}

	@Override
	public void nwrite(HashMap<String, String> param) {
		log.info("@# NoticeSeviceImpl.write() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.nwrite(param);
		
		log.info("@# NoticeSeviceImpl.write() end");		
	}

	@Override
	public NoticeDto ncontentView(HashMap<String, String> param) {
		log.info("@# NoticeSeviceImpl.ncontentView() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		NoticeDto dto = dao.ncontentView(param);
		
		log.info("@# NoticeSeviceImpl.ncontentView() end");
		return dto;
	}

	@Override
	public void nmodify(HashMap<String, String> param) {
		log.info("@# NoticeSeviceImpl.nmodify() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.nmodify(param);
		
		log.info("@# NoticeSeviceImpl.nmodify() end");
		
	}

	@Override
	public void ndelete(HashMap<String, String> param) {
		log.info("@# NoticeSeviceImpl.ndelete() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		dao.ndelete(param);
		
		log.info("@# NoticeSeviceImpl.ndelete() end");
	}

	@Override
	public void nincreaseHit(HashMap<String, String> param) {
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		 dao.nincreaseHit(param);
		
	}

	@Override
	public ArrayList<NoticeDto> nlist(NoticeCriteria ncri) {
		
		log.info("@# NoticeSeviceImpl.list(NoticeCriteria ncri) start");
		log.info("@# ncri===>"+ncri);
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);		
		
		log.info("@# NoticeSeviceImpl.list(NoticeCriteria ncri) end");
		return dao.nlistWithPaging(ncri);
	}

	@Override
	public int getTotalCount(NoticeCriteria ncri) {
		log.info("@# NoticeSeviceImpl.getTotalCount() start");
		
		NoticeDao dao = sqlSession.getMapper(NoticeDao.class);
		
		log.info("@# NoticeSeviceImpl.getTotalCount() end");
		return dao.getTotalCount(ncri);
		}
		
}
