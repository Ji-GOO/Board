package com.jigoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jigoo.domain.CommentVO;
import com.jigoo.domain.Paging;

public interface CommentMapper {

	public int createComment(CommentVO comment);
	
	public CommentVO readComment(Long id);
	
	public int deleteComment(Long id);
	
	public int updateComment(CommentVO comment);
	
	public List<CommentVO> getListWithPaging(
			@Param("paging") Paging paging,
			@Param("post_id") Long post_id);
}
