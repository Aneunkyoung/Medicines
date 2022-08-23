package com.medicines.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Board;
import com.medicines.dto.Comment;
import com.medicines.dto.Drug;
import com.medicines.dto.NoticeBoard;
import com.medicines.dto.Question;
import com.medicines.dto.QuestionComment;
import com.medicines.dto.User;

public interface AdminMapper {
	/*회원검색*/
	List<User> selectAllUserList(Map<String, Object> map);
	int selectUserCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*회원 상태 변경*/
	int updateUserStatus(@Param("status") int status, @Param("id") String id);
	/*인증 상태 변경*/
	int updateAuthStatus(@Param("status") int status, @Param("id") String id);
	
	/*의약품 검색*/
	List<Drug> selectAllDrugList(Map<String, Object> map);
	int selectDrugCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*의약품 삭제*/
	int deleteDrug(String itemSeq);
		
	/*공지사항 리스트*/
	List<NoticeBoard> selectAllNoticeBoardList(Map<String, Object>map);
	int selectNoticeCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*공지사항 삭제*/
	int deleteNotice(int num);
	
	/*게시판 리스트*/
	List<Board> selectAllBoardList(Map<String, Object> map);
	List<Board> selectAllBoardLists();
	int selectBoardCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*게시판 삭제*/
	int deleteBoard(int num);
	
	/*게시판 댓글 리스트*/
	List<Comment> selectAllBoardCommentList(Map<String, Object> map);
	List<Comment> selectAllBoardCommentLists();
	int selectBoardCommentCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*게시판 댓글 삭제*/
	int deleteBoardComment(int no);
	
	/*문의사항 리스트*/
	List<Question> selectQuestionUserList(Map<String, Object> map);
	List<Question> selectQuestionUserLists();
	int selectQuestionCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*문의사항 삭제*/
	int deleteQuestion(int num);
	
	/*문의사항 댓글 리스트*/
	List<QuestionComment> selectAllQuestionCommentList(Map<String, Object> map);
	List<QuestionComment> selectAllQuestionCommentLists();
	int selectQuestionCommentCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*문의사항 댓글 삭제*/
	int deleteQuestionComment(int no);
}
