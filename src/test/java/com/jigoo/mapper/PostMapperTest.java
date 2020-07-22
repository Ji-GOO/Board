package com.jigoo.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jigoo.domain.Paging;
import com.jigoo.domain.PostVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostMapperTest {

	@Autowired
	private PostMapper mapper;
	
	//@Test
	public void testGetAllPost() {
		
		mapper.getAllPost().forEach(post -> log.info(post));
	}
	
	//@Test
	public void testCreatePost() {
		
		PostVO post = new PostVO();
		post.setTitle("반갑습니다~");
		post.setContent("내용을 적어봅니다.");
		post.setUsername("홍길동");
		
		mapper.createPost(post);
		
		log.info(post);
	}
	
	//@Test
	public void testGetOnePost() {
		
		PostVO post = mapper.getOnePost(1L);
		
		log.info(post);
	}
	
	//@Test
	public void deletePost() {
		
		int count = mapper.deletePost(3L);
		
		log.info("DELETE COUNT : " + count);
	}
	
	//@Test
	public void modifyPost() {
		
		PostVO post = new PostVO();
		post.setIdx(1L);
		post.setTitle("수정을 다시 해보았습니다.");
		post.setContent("2차 수정입니다!!");
		
		int count = mapper.modifyPost(post);
		
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testPaging() {
		
		Paging paging = new Paging();
		paging.setPageNumber(2);
		paging.setAmount(10);
		
		List<PostVO> postList = mapper.getPostPaging(paging);
		
		postList.forEach(post -> log.info(post));
	}
}
