package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.Board;
import com.medicines.dto.Comment;
import com.medicines.dto.Drug;
import com.medicines.dto.NoticeBoard;
import com.medicines.dto.Question;
import com.medicines.dto.QuestionComment;
import com.medicines.dto.User;
import com.medicines.mapper.AdminMapper;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<User> selectAllUserList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllUserList(map);
	}

	@Override
	public int updateUserStatus(int status, String id) {
		return sqlSession.getMapper(AdminMapper.class).updateUserStatus(status, id);
	}
	
	@Override
	public int updateAuthStatus(int status, String id) {
		return sqlSession.getMapper(AdminMapper.class).updateAuthStatus(status, id);
	}

	@Override
	public int selectUserCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectUserCount(search_option, keyword);
	}

	@Override
	public List<Drug> selectAllDrugList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllDrugList(map);
	}

	@Override
	public int selectDrugCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectDrugCount(search_option, keyword);
	}
	
	@Override
	public int deleteDrug(String itemSeq) {
		return sqlSession.getMapper(AdminMapper.class).deleteDrug(itemSeq);
	}

	@Override
	public List<NoticeBoard> selectAllNoticeBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllNoticeBoardList(map);
	}

	@Override
	public int selectNoticeCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectNoticeCount(search_option, keyword);
	}
	
	@Override
	public int deleteNotice(int num) {
		return sqlSession.getMapper(AdminMapper.class).deleteNotice(num);
	}

	@Override
	public List<Board> selectAllBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllBoardList(map);
	}
	
	@Override
	public List<Board> selectAllBoardLists() {
		return sqlSession.getMapper(AdminMapper.class).selectAllBoardLists();
	}

	@Override
	public int selectBoardCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardCount(search_option, keyword);
	}
	
	@Override
	public int deleteBoard(int num) {
		return sqlSession.getMapper(AdminMapper.class).deleteBoard(num);
	}

	@Override
	public List<Comment> selectAllBoardCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllBoardCommentList(map);
	}
	@Override
	public List<Comment> selectAllBoardCommentLists() {
		return sqlSession.getMapper(AdminMapper.class).selectAllBoardCommentLists();
	}

	@Override
	public int selectBoardCommentCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectBoardCommentCount(search_option, keyword);
	}
	
	@Override
	public int deleteBoardComment(int no) {
		return sqlSession.getMapper(AdminMapper.class).deleteBoardComment(no);
	}

	@Override
	public List<Question> selectQuestionUserList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectQuestionUserList(map);
	}

	@Override
	public List<Question> selectQuestionUserLists() {
		return sqlSession.getMapper(AdminMapper.class).selectQuestionUserLists();			
	}

	@Override
	public int selectQuestionCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectQuestionCount(search_option, keyword);
	}

	@Override
	public int deleteQuestion(int num) {
		return sqlSession.getMapper(AdminMapper.class).deleteQuestion(num);
	}

	@Override
	public List<QuestionComment> selectAllQuestionCommentList(Map<String, Object> map) {
		return sqlSession.getMapper(AdminMapper.class).selectAllQuestionCommentList(map);
	}

	@Override
	public List<QuestionComment> selectAllQuestionCommentLists() {
		return sqlSession.getMapper(AdminMapper.class).selectAllQuestionCommentLists();
	}

	@Override
	public int selectQuestionCommentCount(String search_option, String keyword) {
		return sqlSession.getMapper(AdminMapper.class).selectQuestionCommentCount(search_option, keyword);
	}
	
	@Override
	public int deleteQuestionComment(int no) {
		return sqlSession.getMapper(AdminMapper.class).deleteQuestionComment(no);
	}

}
