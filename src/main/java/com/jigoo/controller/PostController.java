package com.jigoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jigoo.domain.PostVO;
import com.jigoo.service.PostService;

@Controller
@RequestMapping("/board/")
public class PostController {
	
	@Autowired
	private PostService service;
	
	@GetMapping("list")
	public String listPost(Model model) {
		
		model.addAttribute("post", service.getAllPost());
		
		return "board/list";
	}

	@GetMapping("create")
	public String create() {
		
		return "board/create";
	}
	
	@PostMapping("postcreate")
	public String createPost(PostVO post, RedirectAttributes rttr) {
		
		service.createPost(post);
		
		rttr.addFlashAttribute("result", post.getIdx());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("get")
	public String getPost(@RequestParam("idx") Long idx, Model model) {
		
		model.addAttribute("post", service.getOnePost(idx));
		
		return "board/get";
	}
	
	@PostMapping("modify")
	public String modifyPost(PostVO post, RedirectAttributes rttr) {
		
		if(service.modifyPost(post)) {
			
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
	@PostMapping("delete")
	public String deletePost(@RequestParam("idx") Long idx, RedirectAttributes rttr) {
		
		if(service.deletePost(idx)) {
			
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list";
	}
	
}
