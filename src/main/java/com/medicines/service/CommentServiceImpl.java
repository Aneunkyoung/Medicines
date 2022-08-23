package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicines.dao.CommentDAO;

import com.medicines.dto.Comment;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public void addComment(Comment board) {
		commentDAO.insertComment(board);
	}

	@Override
	public void modifyComment(Comment board) {
		commentDAO.updateComment(board);
	}

	@Override
	public void removeComment(int no) {
		commentDAO.deleteComment(no);
	}

	@Override
	public int getCommentCount(int num) {
		return commentDAO.selectCommentCount(num);
	}

	
	@Override
	public List<Comment> getCommentList(Map<String, Object> map) {
		return commentDAO.selectCommentList(map);
	}

	@Override
	public Comment getCommentByNo(int no) {
		return commentDAO.selectCommentByNo(no);
	}

	@Override
	public int getMyCommentCount(String search_option, String keyword, String id) {
		return commentDAO.selectMyCommentCount(search_option, keyword, id);
	}

	@Override
	public List<Comment> getMyComment(String id) {
		return commentDAO.selectMyComment(id);
	}

	@Override
	public List<Comment> getMyCommentList(Map<String, Object> map) {
		return commentDAO.selectMyCommentList(map);
	}
}
