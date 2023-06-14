package com.spring.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.myproject.domain.Criteria;
import com.spring.myproject.domain.MemberVO;
import com.spring.myproject.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	//회원가입
	@GetMapping("/join")
	public void join() {
		
		log.info("joinForm");
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/join")
	public String join(MemberVO member,RedirectAttributes rttr) {
		
		log.info("join" + member);
		
		
		int res = service.memberJoin(member);;
		
		if(res > 0) {
			return "member/login";
		} else {
			return "redirect:/join";
		}
		
	}
	
	//아이디 중복 검사
	@GetMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) {
			
		log.info("memberIdChk() 진입");
			
		int result = service.idCheck(memberId);
			
		log.info("결과값 = " + result);
			
		if(result != 0) {
			return "fail"; //중복 아이디가 존재
		} else {
			return "success"; //중복 아이디가 x
		}
	}
	
	//로그인
	@GetMapping("/login")
	public void login(String error, String logout, Model model) {
		
		log.info("error: " + error);

		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout");
		}

	}
	
	/*
	 * @PostMapping("/login") public String loginPOST(HttpServletRequest request,
	 * MemberVO member,RedirectAttributes rttr) {
	 * 
	 * HttpSession session = request.getSession(); MemberVO lvo =
	 * service.memberLogin(member);
	 * 
	 * if(lvo == null) {
	 * 
	 * int result = 0; rttr.addFlashAttribute("result", result); return
	 * "redirect:/member/login"; } session.setAttribute("member", lvo);
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 */
	
	//로그아웃
	@GetMapping("/customLogout")
	public void logoutGET() {		

		log.info("custom logout");
	}
	
	//회원정보
	@GetMapping({"/user", "/modify"}) 
	public void get(@RequestParam("memberId") String memberId, Model model) {
		
		log.info("/user or modify");

		model.addAttribute("member", service.get(memberId));
		
	}
	
	//회원정보 수정
	@PostMapping("/modify")
	@PreAuthorize("principal.username == #member.memberId")
	public String modify(MemberVO member, RedirectAttributes rttr) {
		
		log.info("modify" + member);	
		
		service.modify(member);
	    rttr.addFlashAttribute("result", "success");
	            
	      return "redirect:user?memberId=" + member.getMemberId();
	      
	}

	
}
