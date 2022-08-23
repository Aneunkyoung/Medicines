package com.medicines.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Question;
import com.medicines.dto.QuestionUser;

public interface QuestionMapper {
	/*게시물 추가*/
	int insertQuestion(Question question);
	/*게시물 변경*/
	int updateQuestion(Question question);
	/*게시물 삭제*/
	int deleteQuestion(int num);
	/*게시물 개수*/
	int selectQuestionCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*조회수 변경(증가)*/
	int updateReadCount(int num);
	/*게시물 찾기*/
	Question selectQuestion(int num);
	/*모든 게시물 찾기*/
	List<QuestionUser> selectQuestionUserList(Map<String, Object> map);
	/*나의 게시물 개수*/
	int selectMyQuestionBoardCount(@Param("search_option") String search_option, @Param("keyword") String keyword, @Param("id") String id);
	/*나의 게시물 찾기*/
	List<Question> selectMyQuestionBoardList(String id);
	List<QuestionUser> selectQuestionBoardUserMyList(Map<String, Object> map);
}