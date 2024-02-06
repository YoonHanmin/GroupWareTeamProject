package com.green.teamproject_groupware.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FBReply2DTO {
    private int rrid; // 대댓글의 고유 식별자
    private int parentrid;
    private int bid;
    private String rrwriter;
    private String rrcontent;
    private Timestamp rregdate;
}
