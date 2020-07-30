package com.jigoo.domain;

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
	
	private String create_date;
	
	private String modify_date;
}
