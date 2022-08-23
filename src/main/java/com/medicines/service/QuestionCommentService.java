package com.medicines.service;

import java.util.List;
import java.util.Map;

import com.medicines.dto.QuestionComment;

public interface QuestionCommentService {
	void addQuestionComment(QuestionComment comment);
	void modifyQuestionComment(QuestionComment comment);
	void removeQuestionComment(int no);
	int getQuestionCommentCount(int num);
	QuestionComment getQuestionCommentByNo(int no);
	List<QuestionComment> getQuestionCommentList(Map<String, Object> map);
	int getMyQuestionCommentCount(String search_option, String keyword, String id);
	List<QuestionComment> getMyQuestionComment(String id);
	List<QuestionComment> getMyQuestionCommentList(Map<String, Object> map);
}
