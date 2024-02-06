package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FBReplyDTO {
	private int rid;
	private int bid;
	private String rwriter;
	private String rcontent;
	private Timestamp regdate;
	private List<FBReply2DTO> rrlist;  // 대댓글 목록 속성
	}
