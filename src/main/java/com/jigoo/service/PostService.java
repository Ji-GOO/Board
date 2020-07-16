package com.jigoo.service;

import java.util.List;

import com.jigoo.domain.PostVO;

public interface PostService {
	
	public List<PostVO> getAllPost();
	
	public PostVO getOnePost(Long idx);
	
	public void createPost(PostVO post);
	
	public boolean modifyPost(PostVO post);
	
	public boolean deletePost(Long idx);

}
