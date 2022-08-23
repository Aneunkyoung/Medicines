package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Comment;

public interface CommentDAO {
	/*댓글 삽입*/
	int insertComment(Comment comment);
	/*댓글 변경*/
	int updateComment(Comment comment);
	/*댓글 삭제*/
	int deleteComment(int no);
	/*댓글 갯수*/
	int selectCommentCount(int num);
	/*게시물에 대한 댓글*/
	Comment selectCommentByNo(int no);
	/*댓글 출력*/
	List<Comment> selectCommentList(Map<String, Object> map);
	/*나의 댓글 갯수*/
	int selectMyCommentCount(@Param("search_option") String search_option, @Param("keyword") String keyword, @Param("id") String id);
	/*댓글 댓글 출력*/
	List<Comment> selectMyComment(String id);
	List<Comment> selectMyCommentList(Map<String, Object> map);
}
