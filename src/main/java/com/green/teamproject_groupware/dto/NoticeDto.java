package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDto {
	private int nid;
	private String nname;
	private String ntitle;
	private String ncontent;
	private Timestamp ndate;
	private int nhit;
	private int nempno;

}
