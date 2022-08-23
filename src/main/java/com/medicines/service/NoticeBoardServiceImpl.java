package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicines.dao.NoticeBoardDAO;
import com.medicines.dto.NoticeBoard;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;

	@Override
	public void addNoticeBoard(NoticeBoard NoticeBoard) {
		noticeBoardDAO.insertNoticeBoard(NoticeBoard);
	}

	@Override
	public void modifyNoticeBoard(NoticeBoard NoticeBoard) {
		noticeBoardDAO.updateNoticeBoard(NoticeBoard);
	}

	@Override
	public void modifyReadCount(int num) {
		noticeBoardDAO.updateReadCount(num);
	}

	@Override
	public void removeNoticeBoard(int num) {
		noticeBoardDAO.deleteNoticeBoard(num);
	}

	@Override
	public void removeFile(int num) {
		noticeBoardDAO.deleteFile(num);
	}
	
	@Override
	public int getNoticeBoardCount(String search_option, String keyword) {
		return noticeBoardDAO.selectNoticeBoardCount(search_option, keyword);
	}

	@Override
	public NoticeBoard getNoticeBoard(int num) {
		return noticeBoardDAO.selectNoticeBoard(num);
	}

	@Override
	public List<NoticeBoard> getNoticeBoardList(Map<String, Object> map) {
		return noticeBoardDAO.selectNoticeBoardList(map);
	}

}
