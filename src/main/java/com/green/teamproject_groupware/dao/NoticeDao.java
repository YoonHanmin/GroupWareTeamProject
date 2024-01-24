package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.teamproject_groupware.dto.NoticeCriteria;
import com.green.teamproject_groupware.dto.NoticeDto;

public interface NoticeDao {
	public ArrayList<NoticeDto> notice_list();
	public void nwrite(HashMap<String, String> param);
	public NoticeDto ncontentView(HashMap<String, String> param);
	public void nmodify(HashMap<String, String> param);
	public void ndelete(HashMap<String, String> param);
	public void nincreaseHit(HashMap<String, String> param);

	public ArrayList<NoticeDto> nlistWithPaging(NoticeCriteria ncri);
	public int getTotalCount(NoticeCriteria ncri);
}
