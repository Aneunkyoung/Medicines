package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.QuestionComment;

public interface QuestionCommentDAO {
	/*댓글 삽입*/
	int insertQuestionComment(QuestionComment questionComment);
	/*댓글 변경*/
	int updateQuestionComment(QuestionComment questionComment);
	/*댓글 삭제*/
	int deleteQuestionComment(int no);
	/*댓글 갯수*/
	int selectQuestionCommentCount(int num);
	/*게시물에 대한 댓글*/
	QuestionComment selectQuestionCommentByNo(int no);
	/*댓글 출력*/
	List<QuestionComment> selectQuestionCommentList(Map<String, Object> map);
	/*나의 댓글 갯수*/
	int selectMyQuestionCommentCount(@Param("search_option") String search_option, @Param("keyword") String keyword, @Param("id") String id);
	/*댓글 댓글 출력*/
	List<QuestionComment> selectMyQuestionComment(String id);
	List<QuestionComment> selectMyQuestionCommentList(Map<String, Object> map);
}
