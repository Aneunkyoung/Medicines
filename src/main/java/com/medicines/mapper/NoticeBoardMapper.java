package com.medicines.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.NoticeBoard;

public interface NoticeBoardMapper {
	/*게시물 삽입*/
	int insertNoticeBoard(NoticeBoard NoticeBoard);
	/*게시물 변경*/
	int updateNoticeBoard(NoticeBoard NoticeBoard); 
	/*게시글 조회수 증가*/
	int updateReadCount(int num); 
	/*게시글 삭제*/
	int deleteNoticeBoard(int num);
	/*파일 삭제*/
	int deleteFile(int num);	
	/*게시글 총 갯수*/
	int selectNoticeBoardCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	/*번호로 게시글 찾기*/
	NoticeBoard selectNoticeBoard(int num);
	/*모든 게시글 찾기*/
	List<NoticeBoard> selectNoticeBoardList(Map<String, Object>map);
}
