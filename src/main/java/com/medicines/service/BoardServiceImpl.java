package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medicines.dao.BoardDAO;
import com.medicines.dto.Board;
import com.medicines.dto.BoardUser;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Transactional
	@Override
	public void addBoard(Board board) {
		boardDAO.insertBoard(board);
	}

	@Transactional
	@Override
	public void modifyBoard(Board board) {
		boardDAO.updateBoard(board);
	}

	@Transactional
	@Override
	public void removeBoard(int num) {
		boardDAO.deleteBoard(num);
	}

	@Override
	public int getBoardCount(String search_option, String keyword) {
		return boardDAO.selectBoardCount(search_option, keyword);
	}

	@Override
	public Board getBoard(int num) {
		return boardDAO.selectBoard(num);
	}
	
	@Override
	public List<Board> getMyBoardList(String id) {
		return boardDAO.selectMyBoardList(id);
	}

	@Transactional
	@Override
	public void modifyReadCount(int num) {
		boardDAO.updateReadCount(num);
	}

	@Override
	public List<BoardUser> getBoardUserList(Map<String, Object> map) {
		return boardDAO.selectBoardUserList(map);
	}

	@Override
	public List<BoardUser> getBoardUserMyList(Map<String, Object> map) {
		return boardDAO.selectBoardUserMyList(map);
	}

	@Override
	public int getMyBoardCount(String search_option, String keyword, String id) {
		return boardDAO.selectMyBoardCount(search_option, keyword, id);
	}
}
