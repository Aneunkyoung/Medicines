package com.medicines.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Chat;

public interface ChatMapper {
	int insertChat(Chat chat);
	int updateChatRead(@Param("fromId") String fromId, @Param("toId") String toId);
	int selectAllUnreadChat(String id);
	List<int[]> selectUnreadChat(@Param("fromId") String fromId, @Param("toId") String toId);
	List<Chat> selectChatListById(@Param("fromId") String fromId, @Param("toId") String toId, @Param("chatId") String chatId);
	List<Chat> selectChatListByRecent(String id);
}
