package com.medicines.service;

import java.util.List;
import java.util.Map;

import com.medicines.dto.Board;
import com.medicines.dto.Comment;
import com.medicines.dto.Drug;
import com.medicines.dto.NoticeBoard;
import com.medicines.dto.Question;
import com.medicines.dto.QuestionComment;
import com.medicines.dto.User;

public interface AdminService {
	/* 회원 */
	List<User> getUserLists(Map<String, Object> map);
	int getUserCount(String search_option, String keyword); 
	int modifyUserStatus(int status, String id); 
	int modifyAuthStatus(int status, String id); 
	
	/* 의약품 */
	List<Drug> getDrugLists(Map<String, Object> map);
	int getDrugCount(String search_option, String keyword); 
	void removeDrug(String itemSeq);
	
	/* 공지사항 */
	List<NoticeBoard> getNoticeLists(Map<String, Object> map);
	int getNoticeCount(String search_option, String keyword); 
	void removeNotice(int num);
	
	/* 게시판  */
	List<Board> getBoardLists(Map<String, Object> map);
	List<Board> getBoardList();
	int getBoardCount(String search_option, String keyword); 
	void removeBoard(int num);
	
	/* 게시판 댓글 */
	List<Comment> getBoardCommentLists(Map<String, Object> map);
	List<Comment> getBoardCommentList();
	int getBoardCommentCount(String search_option, String keyword); 
	void removeBoardComment(int no);
	
	/* 문의사항  */
	List<Question> getQuestionLists(Map<String, Object> map);
	List<Question> getQuestionList();
	int getQuestionCount(String search_option, String keyword); 
	void removeQuestion(int num);
	
	/* 문의사항 댓글 */
	List<QuestionComment> getQuestionCommentLists(Map<String, Object> map);
	List<QuestionComment> getQuestionCommentList();
	int getQuestionCommentCount(String search_option, String keyword); 
	void removeQuestionComment(int no);
}
