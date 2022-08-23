package com.medicines.service;

import java.util.List;
import java.util.Map;


import com.medicines.dto.Comment;

public interface CommentService {
	void addComment(Comment board);
	void modifyComment(Comment board);
	void removeComment(int no);
	int getCommentCount(int num);
	Comment getCommentByNo(int no);
	List<Comment> getCommentList(Map<String, Object> map);
	int getMyCommentCount(String search_option, String keyword, String id);
	List<Comment> getMyComment(String id);
	List<Comment> getMyCommentList(Map<String, Object> map);
}
