package com.green.teamproject_groupware.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.green.teamproject_groupware.dao.ExpenseDao;
import com.green.teamproject_groupware.dao.SupplyDao;
import com.green.teamproject_groupware.dto.ExpenseDto;
import com.green.teamproject_groupware.dto.SupplyDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("ExpenseService")
public class ExpenseServiceImpl implements ExpenseService {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public ArrayList<ExpenseDto> expense_list(String empno, String insaYn) {
		log.info("@# ExpenseServiceImpl.expense_list() start");
		ExpenseDao dao = sqlSession.getMapper(ExpenseDao.class);
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("empno", empno);
		param.put("insaYn", insaYn);
		
		ArrayList<ExpenseDto> expenseList = dao.expense_list(param);
		
		log.info("@# ExpenseServiceImpl.expense_list() end");
		return expenseList ;
	}

	@Override
	public void expense_write(ExpenseDto formData3) {
		log.info("@# ExpenseServiceImpl.expense_write() start");
		
		 try {
			 ExpenseDao dao = sqlSession.getMapper(ExpenseDao.class);
			 dao.expense_write(formData3);
		        log.info("@# expense_write Success!");
		    } catch (Exception e) {
		        log.error("@# expense_write Failed: " + e.getMessage());
		        e.printStackTrace();
		        throw new RuntimeException("Write Failed", e);
		    }

		 log.info("@# ExpenseServiceImpl.expense_write() end");
	}

	@Override
	public ExpenseDto expense_contentView(HashMap<String, String> param) {
		log.info("@# ExpenseServiceImpl.expense_contentView() start");
		
		ExpenseDao dao = sqlSession.getMapper(ExpenseDao.class);
		ExpenseDto dto = dao.expense_contentView(param);
		
		log.info("@# ExpenseServiceImpl.expense_contentView() end");
		
		return dto;
	}

	@Override
	public void expense_delete(String expense_id) {
		log.info("@# ExpenseServiceImpl.delete() start");
		
		ExpenseDao dao = sqlSession.getMapper(ExpenseDao.class);
		dao.expense_delete(expense_id);
	}

	@Override
	public void expenseApprovalUpdate(String expense_id) {
		log.info("@# ExpenseServiceImpl.expenseApprovalUpdate() start");
		
		ExpenseDao dao = sqlSession.getMapper(ExpenseDao.class);
		dao.expenseApprovalUpdate(expense_id);
		
	}

	@Override
	public void expenseRejectUpdate(String expense_id) {
		log.info("@# ExpenseServiceImpl.expenseRejectUpdate() start");
		
		ExpenseDao dao = sqlSession.getMapper(ExpenseDao.class);
		dao.expenseRejectUpdate(expense_id);
		
	}

	@Override
	public void expense_modify(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		
	}


}