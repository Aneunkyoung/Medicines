package com.medicines.service;

import java.util.List;
import java.util.Map;

import com.medicines.dto.Board;
import com.medicines.dto.BoardUser;

public interface BoardService {
	void addBoard(Board board); 
	void modifyBoard(Board board); 
	void modifyReadCount(int num); 
	void removeBoard(int num); 
	int getBoardCount(String search_option, String keyword); 
	int getMyBoardCount(String search_option, String keyword, String id); 
	Board getBoard(int num); 
	List<Board> getMyBoardList(String id); 
	List<BoardUser> getBoardUserMyList(Map<String, Object> map);
	List<BoardUser> getBoardUserList(Map<String, Object> map);
}
