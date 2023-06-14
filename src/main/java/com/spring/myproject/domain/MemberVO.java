package com.spring.myproject.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberMail;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private Date regDate;
	
	private boolean enabled;
	private List<AuthVO> authList;
	
}
