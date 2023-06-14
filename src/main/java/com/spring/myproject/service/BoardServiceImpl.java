package com.spring.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.myproject.domain.BoardVO;
import com.spring.myproject.domain.Criteria;
import com.spring.myproject.mapper.BoardMapper;
import com.spring.myproject.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Override
	public void register(BoardVO board) {
		log.info("register......" + board);
	      
		 mapper.insertSelectKey(board);
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get...." + bno);
				
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify..." + board);
		
		return mapper.update(board) ==1 ;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		
		replyMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	/*
	 * @Override public List<BoardVO> getList() { return mapper.getList(); }
	 */
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public int viewcount(Long bno) {
		return mapper.viewcount(bno);
	}

}
