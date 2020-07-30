package com.jigoo.domain;

import lombok.Data;

@Data
public class CommentVO {

	private Long id;
	
	private Long post_id;
	
	private String content;
	
	private String username;
	
	private String create_date;
	
	private String modify_date;
}
