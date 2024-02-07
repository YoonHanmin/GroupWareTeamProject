package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.green.teamproject_groupware.dto.ExpenseDto;

public interface ExpenseService {
	public ArrayList<ExpenseDto> expense_list(String empno, String insaYn);
	 public void expense_write(ExpenseDto formData3);
	public ExpenseDto expense_contentView(HashMap<String, String> param);
	public void expense_modify(HashMap<String, String> param);
	public void expense_delete(String expense_id);
	public void expenseRejectUpdate(String expense_id);
	public void expenseApprovalUpdate(String expense_id);
	
}