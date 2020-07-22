package com.jigoo.mapper;

import com.jigoo.domain.CommentVO;

public interface CommentMapper {

	public int createComment(CommentVO comment);
	
	public CommentVO readComment(Long id);
	
	public int deleteComment(Long id);
	
	public int updateComment(CommentVO comment);
}
