package com.spring.myproject.service;

import java.util.List;

import com.spring.myproject.domain.BoardVO;
import com.spring.myproject.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board); //Create
	
	public BoardVO get(Long bno); //Read
	
	public boolean modify(BoardVO board); //Update
	
	public boolean remove(Long bno);  //delete
	
	//public List<BoardVO> getList(); //목록 select
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int viewcount(Long bno);

}
