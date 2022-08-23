package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.Board;
import com.medicines.dto.BoardUser;
import com.medicines.dto.Question;
import com.medicines.dto.QuestionUser;
import com.medicines.mapper.BoardMapper;
import com.medicines.mapper.QuestionMapper;

@Repository
public class QuestionDAOImpl implements QuestionDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertQuestion(Question question) {
		return sqlSession.getMapper(QuestionMapper.class).insertQuestion(question);
	}

	@Override
	public int updateQuestion(Question question) {
		return sqlSession.getMapper(QuestionMapper.class).updateQuestion(question);
	}

	@Override
	public int deleteQuestion(int num) {
		return sqlSession.getMapper(QuestionMapper.class).deleteQuestion(num);
	}

	@Override
	public int selectQuestionCount(String search_option, String keyword) {
		return sqlSession.getMapper(QuestionMapper.class).selectQuestionCount(search_option, keyword);
	}

	@Override
	public int updateReadCount(int num) {
		return sqlSession.getMapper(QuestionMapper.class).updateReadCount(num);
	}

	@Override
	public Question selectQuestion(int num) {
		return sqlSession.getMapper(QuestionMapper.class).selectQuestion(num);
	}

	@Override
	public List<QuestionUser> selectQuestionUserList(Map<String, Object> map) {
		return sqlSession.getMapper(QuestionMapper.class).selectQuestionUserList(map);
	}

	@Override
	public int selectMyQuestionBoardCount(String search_option, String keyword, String id) {
		return sqlSession.getMapper(QuestionMapper.class).selectMyQuestionBoardCount(search_option, keyword, id);
	}

	@Override
	public List<Question> selectMyQuestionBoardList(String id) {
		return sqlSession.getMapper(QuestionMapper.class).selectMyQuestionBoardList(id);
	}

	@Override
	public List<QuestionUser> selectQuestionBoardUserMyList(Map<String, Object> map) {
		return sqlSession.getMapper(QuestionMapper.class).selectQuestionBoardUserMyList(map);
	}

	
}