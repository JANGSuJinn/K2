package com.spring.myproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring.myproject.domain.BoardVO;
import com.spring.myproject.domain.Criteria;

public interface BoardMapper {
	
	//@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public Integer insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno); //조회
	
	public int delete(Long bno); //삭제
	
	public int update(BoardVO board); //수정

	public int getTotalCount(Criteria cri);
	
	public int viewcount(Long bno); //조회수
	
	public void replyCnt(@Param("bno")Long bno, @Param("amount")int amount);

}
