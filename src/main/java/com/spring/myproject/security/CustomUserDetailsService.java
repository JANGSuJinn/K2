package com.spring.myproject.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.myproject.domain.MemberVO;
import com.spring.myproject.mapper.MemberMapper;
import com.spring.myproject.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
   
   @Setter(onMethod_ = {@Autowired})
   private MemberMapper memberMapper;

   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      
      MemberVO member = memberMapper.read(username);
      
      log.warn("Load User By Username" + username);
      
      return member == null ? null : new CustomUser(member);
   }

}