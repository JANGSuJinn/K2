package com.spring.myproject.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myproject.domain.BoardVO;
import com.spring.myproject.domain.Criteria;
import com.spring.myproject.domain.PageDTO;
import com.spring.myproject.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total  = service.getTotal(cri);
		log.info("total: "+ total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		log.info("-----registerForm");
	}
	
	@PostMapping("/register") //등록
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		  
		 log.info("==========================");
		  
		 service.register(board);
		  
		 rttr.addFlashAttribute("result", board.getBno());
		  
		 return "redirect:list";  
	}

	@GetMapping({"/get", "/modify"}) //조회
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("board", service.get(bno));
		
		service.viewcount(bno);
	}
	
	@PostMapping("/modify") //수정
	@PreAuthorize("principal.username == #board.writer")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify" + board);
		
		if(service.modify(board))
			rttr.addFlashAttribute("result", "success");
		/*
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		*/	
		return "redirect:list" + cri.getListLink();
	}
	
	@PostMapping("/remove") //삭제
	@PreAuthorize("principal.username == #writer")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, String writer) {
		
		log.info("remove" + bno);
		
		if(service.remove(bno))
			rttr.addFlashAttribute("result", "success");
		/*
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		*/
		
		return "redirect:list" + cri.getListLink();
	}


}
