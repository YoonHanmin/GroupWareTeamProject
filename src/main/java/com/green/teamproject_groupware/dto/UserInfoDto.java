package com.green.teamproject_groupware.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class UserInfoDto {
		private String empno;
		private String name;
		private String password;
		private String email;
		private String tel;
		private String address;
		private String dname;
		
	}

