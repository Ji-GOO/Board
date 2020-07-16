package com.jigoo.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class MemberVO {

	private Long idx;
	
	private String userid;
	
	private String password;
	
	private String username;
}
