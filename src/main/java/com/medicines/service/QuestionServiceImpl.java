package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medicines.dao.QuestionDAO;
import com.medicines.dto.Question;
import com.medicines.dto.QuestionUser;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDAO questionDAO;

	@Transactional
	@Override
	public void addQuestion(Question Question) {
		questionDAO.insertQuestion(Question);
	}

	@Transactional
	@Override
	public void modifyQuestion(Question Question) {
		questionDAO.updateQuestion(Question);
	}

	@Transactional
	@Override
	public void removeQuestion(int num) {
		questionDAO.deleteQuestion(num);
	}

	@Override
	public int getQuestionCount(String search_option, String keyword) {
		return questionDAO.selectQuestionCount(search_option, keyword);
	}

	@Override
	public Question getQuestion(int num) {
		return questionDAO.selectQuestion(num);
	}

	@Transactional
	@Override
	public void modifyReadCount(int num) {
		questionDAO.updateReadCount(num);
	}

	@Override
	public List<QuestionUser> getQuestionUserList(Map<String, Object> map) {
		return questionDAO.selectQuestionUserList(map);
	}

	@Override
	public List<Question> getMyQuestionBoardList(String id) {
		return questionDAO.selectMyQuestionBoardList(id);
	}

	@Override
	public List<QuestionUser> getQuestionBoardUserMyList(Map<String, Object> map) {
		return questionDAO.selectQuestionBoardUserMyList(map);
	}

	@Override
	public int getMyQuestionBoardCount(String search_option, String keyword, String id) {
		return questionDAO.selectMyQuestionBoardCount(search_option, keyword, id);
	}
}
