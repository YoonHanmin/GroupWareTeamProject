package com.green.teamproject_groupware.dto;
import lombok.Data;

@Data
public class DocDto {
    private int doc_id;
    private String doc_title;
    private String doc_content;
    private String doc_status;
}