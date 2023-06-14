package com.spring.myproject.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.myproject.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	/*
	@Test
	public void memberJoin() {
		MemberVO member = new MemberVO();
		
		member.setMemberId("spring_test");
		member.setMemberPw("spring_test");
		member.setMemberName("spring_test");
		member.setMemberMail("spring_test");
		member.setMemberAddr1("spring_test");
		member.setMemberAddr2("spring_test");
		member.setMemberAddr3("spring_test");
		
		mapper.memberJoin(member);
	}
	
	@Test
	public void memberLogin() {
		MemberVO member = new MemberVO();
		
		member.setMemberId("a");
		member.setMemberPw("a");
		
		mapper.memberLogin(member);
		System.out.println("결과 값 : " + mapper.memberLogin(member));
	}
	
	@Test
	public void memberIdChk() {
		String id = "admin";
		String id2 = "test123";
		mapper.idCheck(id);
		mapper.idCheck(id2);
	}
	*/
	@Test
	public void testRead() {

		MemberVO vo = mapper.read("b");

		log.info(vo);

		vo.getAuthList().forEach(authVO -> log.info(authVO));

	}
	
}
