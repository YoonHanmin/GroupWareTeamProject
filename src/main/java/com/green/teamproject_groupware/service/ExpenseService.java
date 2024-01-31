package com.green.teamproject_groupware.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.green.teamproject_groupware.dto.ExpenseDto;

public interface ExpenseService {
	public ArrayList<ExpenseDto> expense_list();
	 public void expense_write(ExpenseDto formData3);
	public ExpenseDto expense_contentView(HashMap<String, String> param);
	public void expense_modify(HashMap<String, String> param);
	public void expense_delete(HashMap<String, String> param);
	
}
