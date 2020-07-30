package com.jigoo.service;

import java.util.List;

import com.jigoo.domain.CommentVO;
import com.jigoo.domain.Paging;

public interface CommentService {

	public int createComment(CommentVO comment);
	
	public CommentVO getOneComment(Long id);
	
	public int modifyComment(CommentVO comment);
	
	public int deleteComment(Long id);
	
	public List<CommentVO> getAllComment(Paging paging, Long post_id);
}
