package com.spring.myproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.myproject.domain.Criteria;
import com.spring.myproject.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo); //등록
	
	public ReplyVO read(Long bno); //조회

	public int delete(Long bno); //삭제
	
	public int deleteAll(Long bno); //모두 삭제

	public int update(ReplyVO reply); //수정
	
	public List<ReplyVO> getListWithPaging(
	        @Param("cri") Criteria cri, 
	        @Param("bno") Long bno);
	  
	public int getCountByBno(Long bno);

}
