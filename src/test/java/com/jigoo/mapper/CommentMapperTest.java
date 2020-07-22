package com.jigoo.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jigoo.domain.CommentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTest {
	
	@Autowired
	private CommentMapper mapper;
	
	private Long[] postIdArr = {10L, 40L, 77L, 130L, 150L};
	
	//@Test
	public void testCommentMapper() {
		
		log.info(mapper);
	}
	
	//@Test
	public void testCreateComment() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			CommentVO comment = new CommentVO();
			comment.setPost_id(postIdArr[i % 5]);
			comment.setContent("댓글이 잘 달아지나??" + i);
			comment.setUsername("지구" + i);
			
			mapper.createComment(comment);
		});
	}
	
	//@Test
	public void testReadComment() {
		
		Long id = 4L;
		
		CommentVO comment = mapper.readComment(id);
		
		log.info(comment);
	}
	
	//@Test
	public void testDeleteComment() {
		
		Long id = 4L;
		
		mapper.deleteComment(id);
	}
	
	@Test
	public void testUpdateComment() {
		
		Long id = 5L;
		
		CommentVO comment = mapper.readComment(id);
		comment.setContent("댓글을 수정하였습니다.");
		
		int count = mapper.updateComment(comment);
		
		log.info("UPDATE COUNT : " + count);
	}
}
