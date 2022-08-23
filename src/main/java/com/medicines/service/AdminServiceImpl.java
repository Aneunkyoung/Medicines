package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicines.dao.AdminDAO;
import com.medicines.dto.Board;
import com.medicines.dto.Comment;
import com.medicines.dto.Drug;
import com.medicines.dto.NoticeBoard;
import com.medicines.dto.Question;
import com.medicines.dto.QuestionComment;
import com.medicines.dto.User;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public List<User> getUserLists(Map<String, Object> map) {
		return adminDAO.selectAllUserList(map);
	}

	@Override
	public int modifyUserStatus(int status, String id) {
		return adminDAO.updateUserStatus(status, id);
	}
	@Override
	
	public int modifyAuthStatus(int status, String id) {
		return adminDAO.updateAuthStatus(status, id);
	}

	@Override
	public int getUserCount(String search_option, String keyword) {
		return adminDAO.selectUserCount(search_option, keyword);
	}

	@Override
	public List<Drug> getDrugLists(Map<String, Object> map) {
		return adminDAO.selectAllDrugList(map);
	}

	@Override
	public int getDrugCount(String search_option, String keyword) {
		return adminDAO.selectDrugCount(search_option, keyword);
	}
	
	@Override
	public void removeDrug(String itemSeq) {
		adminDAO.deleteDrug(itemSeq);
	}

	@Override
	public List<NoticeBoard> getNoticeLists(Map<String, Object> map) {
		return adminDAO.selectAllNoticeBoardList(map);
	}

	@Override
	public int getNoticeCount(String search_option, String keyword) {
		return adminDAO.selectNoticeCount(search_option, keyword);
	}

	@Override
	public void removeNotice(int num) {
		adminDAO.deleteNotice(num);
	}

	@Override
	public List<Board> getBoardLists(Map<String, Object> map) {
		return adminDAO.selectAllBoardList(map);
	}
	
	@Override
	public List<Board> getBoardList() {
		return adminDAO.selectAllBoardLists();
	}

	@Override
	public int getBoardCount(String search_option, String keyword) {
		return adminDAO.selectBoardCount(search_option, keyword);
	}

	@Override
	public void removeBoard(int num) {
		adminDAO.deleteBoard(num);
	}

	@Override
	public List<Comment> getBoardCommentLists(Map<String, Object> map) {
		return adminDAO.selectAllBoardCommentList(map);
	}
	@Override
	public List<Comment> getBoardCommentList() {
		return adminDAO.selectAllBoardCommentLists();
	}

	@Override
	public int getBoardCommentCount(String search_option, String keyword) {
		return adminDAO.selectBoardCommentCount(search_option, keyword);
	}

	@Override
	public void removeBoardComment(int no) {
		adminDAO.deleteBoardComment(no);
	}

	@Override
	public List<Question> getQuestionLists(Map<String, Object> map) {
		return adminDAO.selectQuestionUserList(map);
	}

	@Override
	public List<Question> getQuestionList() {
		return adminDAO.selectQuestionUserLists();
	}

	@Override
	public int getQuestionCount(String search_option, String keyword) {
		return adminDAO.selectQuestionCount(search_option, keyword);
	}

	@Override
	public void removeQuestion(int num) {
		adminDAO.deleteQuestion(num);
	}

	@Override
	public List<QuestionComment> getQuestionCommentLists(Map<String, Object> map) {
		return adminDAO.selectAllQuestionCommentList(map);
	}

	@Override
	public List<QuestionComment> getQuestionCommentList() {
		return adminDAO.selectAllQuestionCommentLists();
	}

	@Override
	public int getQuestionCommentCount(String search_option, String keyword) {
		return adminDAO.selectQuestionCommentCount(search_option, keyword);
	}
	
	@Override
	public void removeQuestionComment(int no) {
		adminDAO.deleteQuestionComment(no);
	}
}
