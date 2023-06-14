package com.spring.myproject.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.myproject.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;	

	private MemberVO member;
	
	public CustomUser(String memberId, String memberPw, 
			Collection<? extends GrantedAuthority> authorities) {
		super(memberId, memberPw, authorities);
	}
	
	public CustomUser(MemberVO vo) {

		super(vo.getMemberId(), vo.getMemberPw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));

		this.member = vo;
	}
}
