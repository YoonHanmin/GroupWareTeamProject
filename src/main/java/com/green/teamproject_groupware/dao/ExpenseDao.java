package com.green.teamproject_groupware.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.green.teamproject_groupware.dto.ExpenseDto;
import com.green.teamproject_groupware.dto.VehicleDto;

public interface ExpenseDao {
	public ArrayList<ExpenseDto> expense_list(HashMap<String, String> param);
	 public void expense_write(ExpenseDto formData3);
	public ExpenseDto expense_contentView(HashMap<String, String> param);
	public void expense_modify(HashMap<String, String> param);
	public void expense_delete(String expense_id);
	public void expenseApprovalUpdate(String expense_id);
	public void expenseRejectUpdate(String expense_id);
	
}