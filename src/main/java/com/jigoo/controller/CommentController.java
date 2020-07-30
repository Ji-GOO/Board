package com.jigoo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jigoo.domain.CommentVO;
import com.jigoo.domain.Paging;
import com.jigoo.service.CommentService;

@RestController
@RequestMapping("/comment/")
public class CommentController {

	@Autowired
	private CommentService service;
	
	@PostMapping(value = "create", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> createComment(@RequestBody CommentVO comment) {
		
		int createCount = service.createComment(comment);
		
		return createCount == 1 
				? new ResponseEntity<> ("success", HttpStatus.OK) 
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "pages/{post_id}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CommentVO>> getAllComment(@PathVariable("page") int page, @PathVariable("post_id") Long post_id) {
		
		Paging paging = new Paging(page, 10);
		
		return new ResponseEntity<> (service.getAllComment(paging, post_id), HttpStatus.OK);
	}
	
	@GetMapping(value = "{id}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<CommentVO> getOneComment(@PathVariable("id") Long id) {
		
		return new ResponseEntity<> (service.getOneComment(id), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "{id}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteComment(@PathVariable("id") Long id) {
		
		return service.deleteComment(id) == 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "{id}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyComment(@RequestBody CommentVO comment, @PathVariable("id") Long id) {
		
		comment.setId(id);
		
		return service.modifyComment(comment) == 1
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
