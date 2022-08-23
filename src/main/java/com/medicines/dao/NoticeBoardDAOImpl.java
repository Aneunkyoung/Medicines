package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.NoticeBoard;
import com.medicines.mapper.NoticeBoardMapper;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNoticeBoard(NoticeBoard NoticeBoard) {
		return sqlSession.getMapper(NoticeBoardMapper.class).insertNoticeBoard(NoticeBoard);
	}

	@Override
	public int updateNoticeBoard(NoticeBoard NoticeBoard) {
		return sqlSession.getMapper(NoticeBoardMapper.class).updateNoticeBoard(NoticeBoard);
	}

	@Override
	public int updateReadCount(int num) {
		return sqlSession.getMapper(NoticeBoardMapper.class).updateReadCount(num);
	}

	@Override
	public int deleteNoticeBoard(int num) {
		return sqlSession.getMapper(NoticeBoardMapper.class).deleteNoticeBoard(num);
	}
	
	@Override
	public int deleteFile(int num) {
		return sqlSession.getMapper(NoticeBoardMapper.class).deleteFile(num);
	}


	@Override
	public int selectNoticeBoardCount(String search_option, String keyword) {
		return sqlSession.getMapper(NoticeBoardMapper.class).selectNoticeBoardCount(search_option, keyword);
	}

	@Override
	public NoticeBoard selectNoticeBoard(int num) {
		return sqlSession.getMapper(NoticeBoardMapper.class).selectNoticeBoard(num);
	}

	@Override
	public List<NoticeBoard> selectNoticeBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(NoticeBoardMapper.class).selectNoticeBoardList(map);
	}

}
