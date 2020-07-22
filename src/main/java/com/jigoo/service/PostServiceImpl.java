package com.jigoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jigoo.domain.Paging;
import com.jigoo.domain.PostVO;
import com.jigoo.mapper.PostMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class PostServiceImpl implements PostService {

	@Autowired
	private PostMapper mapper;
	
	@Override
	public List<PostVO> getAllPost(Paging paging) {
		
		return mapper.getPostPaging(paging);
	}
	
	@Override
	public int getTotalCount(Paging paging) {
		
		return mapper.getTotalCount(paging);
	}

	@Override
	public PostVO getOnePost(Long idx) {
		
		return mapper.getOnePost(idx);
	}

	@Override
	public void createPost(PostVO post) {
		
		mapper.createPost(post);
	}

	@Override
	public boolean modifyPost(PostVO post) {
		
		return mapper.modifyPost(post) == 1;
	}

	@Override
	public boolean deletePost(Long idx) {
		
		return mapper.deletePost(idx) == 1;
	}

}
