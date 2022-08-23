package com.medicines.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Chat;

public interface ChatService {
	void addChat(Chat chat);
	void modifyChatRead(@Param("fromId") String fromId, @Param("toId") String toId);
	int getAllUnreadChat(String id);
	List<int[]> getUnreadChat(@Param("fromId") String fromId, @Param("toId") String toId);
	List<Chat> getChatListById(@Param("fromId") String fromId, @Param("toId") String toId, @Param("chatId") String chatId);
	List<Chat> getChatListByRecent(String id);
}
