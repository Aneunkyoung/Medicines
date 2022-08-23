package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.medicines.dto.Comment;
import com.medicines.mapper.CommentMapper;

@Repository
public class CommentDAOImpl implements CommentDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertComment(Comment comment) {
		return sqlSession.getMapper(CommentMapper.class).insertComment(comment);
	}

	@Override
	public int updateComment(Comment comment) {
		return sqlSession.getMapper(CommentMapper.class).updateComment(comment);
	}

	@Override
	public int deleteComment(int no) {
		return sqlSession.getMapper(CommentMapper.class).deleteComment(no);
	}

	@Override
	public int selectCommentCount(int num) {
		return sqlSession.getMapper(CommentMapper.class).selectCommentCount(num);
	}

	@Override
	public List<Comment> selectCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(CommentMapper.class).selectCommentList(map);
	}

	@Override
	public Comment selectCommentByNo(int no) {
		return sqlSession.getMapper(CommentMapper.class).selectCommentByNo(no);
	}

	@Override
	public int selectMyCommentCount(String search_option, String keyword, String id) {
		return sqlSession.getMapper(CommentMapper.class).selectMyCommentCount(search_option, keyword, id);
	}

	@Override
	public List<Comment> selectMyComment(String id) {
		return sqlSession.getMapper(CommentMapper.class).selectMyComment(id);
	}

	@Override
	public List<Comment> selectMyCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(CommentMapper.class).selectMyCommentList(map);
	}

	
}
