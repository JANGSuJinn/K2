package com.spring.myproject.service;

import java.util.List;

import com.spring.myproject.domain.Criteria;
import com.spring.myproject.domain.ReplyPageDTO;
import com.spring.myproject.domain.ReplyVO;

public interface ReplyService {

	  public int register(ReplyVO reply);

	  public ReplyVO get(Long rno);

	  public int modify(ReplyVO reply);

	  public int remove(Long rno);

	  public List<ReplyVO> getList(Criteria cri, Long bno);
	
	  public ReplyPageDTO getListPage(Criteria cri, Long bno);
	  
}
