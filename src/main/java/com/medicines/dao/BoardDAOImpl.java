package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.Board;
import com.medicines.dto.BoardUser;
import com.medicines.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.getMapper(BoardMapper.class).updateBoard(board);
	}

	@Override
	public int deleteBoard(int num) {
		return sqlSession.getMapper(BoardMapper.class).deleteBoard(num);
	}

	@Override
	public int updateReadCount(int num) {
		return sqlSession.getMapper(BoardMapper.class).updateReadCount(num);
	}

	@Override
	public int selectBoardCount(String search_option, String keyword) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardCount(search_option, keyword);
	}

	@Override
	public Board selectBoard(int num) {
		return sqlSession.getMapper(BoardMapper.class).selectBoard(num);
	}
	
	@Override
	public List<Board> selectMyBoardList(String id) {
		return sqlSession.getMapper(BoardMapper.class).selectMyBoardList(id);
	}

	@Override
	public List<BoardUser> selectBoardUserList(Map<String, Object> map) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardUserList(map);
	}

	@Override
	public List<BoardUser> selectBoardUserMyList(Map<String, Object> map) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardUserMyList(map);
	}

	@Override
	public int selectMyBoardCount(String search_option, String keyword, String id) {
		return sqlSession.getMapper(BoardMapper.class).selectMyBoardCount(search_option, keyword, id);
	}

	
}