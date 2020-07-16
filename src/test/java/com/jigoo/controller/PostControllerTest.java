package com.jigoo.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class PostControllerTest {

	@Autowired
	private WebApplicationContext context;
	
	private MockMvc mockMvc;
	
	@Before
	public void beforeSetup() {
		
		this.mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	//@Test
	public void testGetAllPost() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	//@Test
	public void testCreatePost() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/post_create")
				.param("title", "유닛테스트 새글 제목")
				.param("content", "유닛테스트 새글 내용")
				.param("username", "김철수"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	//@Test
	public void testGetOnePost() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("idx", "7"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	//@Test
	public void testModifyPost() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("idx", "7")
				.param("title", "테스트로 수정해봅니다.")
				.param("content", "내용이 수정되었습니다!!"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	@Test
	public void testDeletePost() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/delete")
				.param("idx", "7"))
				.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
}
