package com.jigoo.service;

import static org.junit.Assert.assertNotNull;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jigoo.domain.PostVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostServiceTest {
	
	@Autowired
	private PostService service;
	
	//@Test
	public void testExist() {
		
		log.info(service);
		
		assertNotNull(service);
	}
	
	//@Test
	public void testCreatePost() {
		
		PostVO post = new PostVO();
		post.setTitle("2차 서비스단 테스트 중입니다.");
		post.setContent("2차로 새롭게 만든 내용입니다.");
		post.setUsername("정지구");
		
		service.createPost(post);
		
		log.info("CREATE POST NUMBER : " + post.getIdx());
	}
	
	//@Test
	public void testGetAllPost() {
		
		service.getAllPost().forEach(post -> log.info(post));
	}
	
	//@Test
	public void testGetOnePost() {
		
		log.info(service.getOnePost(6L));
	}
	
	//@Test
	public void testModifyPost() {
		
		PostVO post = service.getOnePost(6L);
		
		if(post == null) {
			
			return;
		}
		
		post.setTitle("3차로 수정해봤습니다.");
		
		log.info("MODIFY RESULT : " + service.modifyPost(post));
	}
	
	//@Test
	public void testDeletePost() {
		
		log.info("DELETE RESULT : " + service.deletePost(5L));
	}

}
