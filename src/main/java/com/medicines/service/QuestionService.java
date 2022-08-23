package com.medicines.service;

import java.util.List;
import java.util.Map;

import com.medicines.dto.Question;
import com.medicines.dto.QuestionUser;

public interface QuestionService {
	void addQuestion(Question Question); 
	void modifyQuestion(Question Question); 
	void modifyReadCount(int num); 
	void removeQuestion(int num); 
	int getQuestionCount(String search_option, String keyword); 
	Question getQuestion(int num); 
	List<QuestionUser> getQuestionUserList(Map<String, Object> map);
	List<Question> getMyQuestionBoardList(String id);
	List<QuestionUser> getQuestionBoardUserMyList(Map<String, Object> map);
	int getMyQuestionBoardCount(String search_option, String keyword, String id);
}