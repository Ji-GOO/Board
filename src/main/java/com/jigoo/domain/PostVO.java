package com.jigoo.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class PostVO {

	private Long idx;
	
	private String title;
	
	private String content;
	
	private String username;
	
	private Date create_date;
	
	private Date modify_date;
}
