package com.jigoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jigoo.domain.CommentVO;
import com.jigoo.domain.Paging;
import com.jigoo.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper mapper;
	
	@Override
	public int createComment(CommentVO comment) {
		
		return mapper.createComment(comment);
	}

	@Override
	public CommentVO getOneComment(Long id) {
		
		return mapper.readComment(id);
	}

	@Override
	public int modifyComment(CommentVO comment) {
		
		return mapper.updateComment(comment);
	}

	@Override
	public int deleteComment(Long id) {
		
		return mapper.deleteComment(id);
	}

	@Override
	public List<CommentVO> getAllComment(Paging paging, Long post_id) {
		
		return mapper.getListWithPaging(paging, post_id);
	}

}
