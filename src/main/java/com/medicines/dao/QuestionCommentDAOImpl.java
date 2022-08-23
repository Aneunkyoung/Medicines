package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.QuestionComment;
import com.medicines.mapper.QuestionCommentMapper;

@Repository
public class QuestionCommentDAOImpl implements QuestionCommentDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertQuestionComment(QuestionComment questionComment) {
		return sqlSession.getMapper(QuestionCommentMapper.class).insertQuestionComment(questionComment);
	}

	@Override
	public int updateQuestionComment(QuestionComment questionComment) {
		return sqlSession.getMapper(QuestionCommentMapper.class).updateQuestionComment(questionComment);
	}

	@Override
	public int deleteQuestionComment(int no) {
		return sqlSession.getMapper(QuestionCommentMapper.class).deleteQuestionComment(no);
	}

	@Override
	public int selectQuestionCommentCount(int num) {
		return sqlSession.getMapper(QuestionCommentMapper.class).selectQuestionCommentCount(num);
	}

	@Override
	public QuestionComment selectQuestionCommentByNo(int no) {
		return sqlSession.getMapper(QuestionCommentMapper.class).selectQuestionCommentByNo(no);
	}

	@Override
	public List<QuestionComment> selectQuestionCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(QuestionCommentMapper.class).selectQuestionCommentList(map);
	}

	@Override
	public int selectMyQuestionCommentCount(String search_option, String keyword, String id) {
		return sqlSession.getMapper(QuestionCommentMapper.class).selectMyQuestionCommentCount(search_option, keyword, id);
	}

	@Override
	public List<QuestionComment> selectMyQuestionComment(String id) {
		return sqlSession.getMapper(QuestionCommentMapper.class).selectMyQuestionComment(id);
	}

	@Override
	public List<QuestionComment> selectMyQuestionCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(QuestionCommentMapper.class).selectMyQuestionCommentList(map);
	}
}
