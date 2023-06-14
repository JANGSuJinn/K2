package com.spring.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.myproject.domain.AuthVO;
import com.spring.myproject.domain.MemberVO;
import com.spring.myproject.mapper.BoardMapper;
import com.spring.myproject.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder passwordEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	/* 회원가입 */
	@Transactional
	@Override
	public int memberJoin(MemberVO member) {
		
		String memberId = member.getMemberId();
		String memberPw = member.getMemberPw();
		String bcriptPw = passwordEncoder.encode(memberPw);
		member.setMemberPw(bcriptPw);
		
		AuthVO auth = new AuthVO();
		
		auth.setAuth("ROLE_MEMBER");
		auth.setMemberId(memberId);
		
		mapper.memberJoin(member);
		
		int result = mapper.memberAuth(auth);
		
		return result;
		
	}
	
	/* 아이디 중복체크 */
	@Override
	public int idCheck(String memberId) {
		return mapper.idCheck(memberId);
	}

	/* 로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) {
		
		return mapper.memberLogin(member);
	}

	/* 회원정보 */
	@Override
	public MemberVO get(String memberId) {
		log.info("get...." + memberId);
		
		return mapper.get(memberId);
	}

	/* 회원정보 수정 */
	@Transactional
	@Override
	public int modify(MemberVO member) {
		log.info("modify..." + member);
		
		String memberId = member.getMemberId();
		String memberPw = member.getMemberPw();
		String bcriptPw = passwordEncoder.encode(memberPw);
		member.setMemberPw(bcriptPw);
		
		AuthVO auth = new AuthVO();
		
		auth.setAuth("ROLE_MEMBER");
		auth.setMemberId(memberId);
		
		mapper.update(member);
		
		int result = mapper.memberAuth(auth);
		
		return result;
	}


}
