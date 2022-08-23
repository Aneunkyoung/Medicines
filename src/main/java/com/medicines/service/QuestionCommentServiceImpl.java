package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicines.dao.CommentDAO;
import com.medicines.dao.QuestionCommentDAO;
import com.medicines.dto.Comment;
import com.medicines.dto.QuestionComment;

@Service
public class QuestionCommentServiceImpl implements QuestionCommentService{
	@Autowired
	private QuestionCommentDAO questionCommentDAO;

	@Override
	public void addQuestionComment(QuestionComment comment) {
		questionCommentDAO.insertQuestionComment(comment);
	}

	@Override
	public void modifyQuestionComment(QuestionComment comment) {
		questionCommentDAO.updateQuestionComment(comment);
	}

	@Override
	public void removeQuestionComment(int no) {
		questionCommentDAO.deleteQuestionComment(no);
	}

	@Override
	public int getQuestionCommentCount(int num) {
		return questionCommentDAO.selectQuestionCommentCount(num);
	}

	@Override
	public QuestionComment getQuestionCommentByNo(int no) {
		return questionCommentDAO.selectQuestionCommentByNo(no);
	}

	@Override
	public List<QuestionComment> getQuestionCommentList(Map<String, Object> map) {
		return questionCommentDAO.selectQuestionCommentList(map);
	}

	@Override
	public int getMyQuestionCommentCount(String search_option, String keyword, String id) {
		return questionCommentDAO.selectMyQuestionCommentCount(search_option, keyword, id);
	}

	@Override
	public List<QuestionComment> getMyQuestionComment(String id) {
		return questionCommentDAO.selectMyQuestionComment(id);
	}

	@Override
	public List<QuestionComment> getMyQuestionCommentList(Map<String, Object> map) {
		return questionCommentDAO.selectMyQuestionCommentList(map);
	}
}
