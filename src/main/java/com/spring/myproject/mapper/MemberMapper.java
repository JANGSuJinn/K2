package com.spring.myproject.mapper;

import java.util.List;

import com.spring.myproject.domain.AuthVO;
import com.spring.myproject.domain.MemberVO;

public interface MemberMapper {

	//회원가입
	public int memberJoin(MemberVO member);
	
	public int memberAuth(AuthVO aVO);
	
	//아이디 중복 검사
	public int idCheck(String memberId);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);

	//회원정보
	public MemberVO get(String memberId);

	//회원정보 수정
	public int update(MemberVO member);
	
	public MemberVO read(String memberId);
	
}
