package com.jigoo.mapper;

import java.util.List;

import com.jigoo.domain.PostVO;

public interface PostMapper {

	public List<PostVO> getAllPost();
	
	public PostVO getOnePost(Long idx);
	
	public void createPost(PostVO post);
	
	public int modifyPost(PostVO post);
	
	public int deletePost(Long idx);
}
