package com.medicines.service;

import java.util.List;
import java.util.Map;

import com.medicines.dto.NoticeBoard;

public interface NoticeBoardService {
	void addNoticeBoard(NoticeBoard NoticeBoard);
	void modifyNoticeBoard(NoticeBoard NoticeBoard);
	void modifyReadCount(int num);
	void removeNoticeBoard(int num);
	void removeFile(int num);
	int getNoticeBoardCount(String search_option, String keyword);
	NoticeBoard getNoticeBoard(int num);
	List<NoticeBoard> getNoticeBoardList(Map<String, Object>map);
}
