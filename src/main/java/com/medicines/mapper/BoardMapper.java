package com.medicines.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Board;
import com.medicines.dto.BoardUser;

public interface BoardMapper {
	/*게시물 추가*/
	int insertBoard(Board board);
	/*게시물 변경*/
	int updateBoard(Board board);
	/*게시물 삭제*/
	int deleteBoard(int num);
	/*게시물 개수*/
	int selectBoardCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*나의 게시물 개수*/
	int selectMyBoardCount(@Param("search_option") String search_option, @Param("keyword") String keyword, @Param("id") String id);
	/*조회수 변경(증가)*/
	int updateReadCount(int num);
	/*게시물 찾기*/
	Board selectBoard(int num);
	/*나의 게시물 찾기*/
	List<Board> selectMyBoardList(String id);
	List<BoardUser> selectBoardUserMyList(Map<String, Object> map);
	/*모든 게시물 찾기*/
	List<BoardUser> selectBoardUserList(Map<String, Object> map);
}