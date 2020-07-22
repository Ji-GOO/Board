package com.jigoo.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {

	private Long id;
	
	private Long post_id;
	
	private String content;
	
	private String username;
	
	private Date create_date;
	
	private Date modify_date;
}
