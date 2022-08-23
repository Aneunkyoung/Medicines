package com.medicines.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medicines.dao.ChatDAO;
import com.medicines.dto.Chat;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;

	@Transactional
	@Override
	public void addChat(Chat chat) {
		chatDAO.insertChat(chat);
	}

	@Override
	public List<Chat> getChatListById(String fromId, String toId, String chatId) {
		return chatDAO.selectChatListById(fromId, toId, chatId);
	}

	@Override
	public List<Chat> getChatListByRecent(String id) {
		return chatDAO.selectChatListByRecent(id);
	}

	@Override
	public void modifyChatRead(String fromId, String toId) {
		chatDAO.updateChatRead(fromId, toId);
	}

	@Override
	public int getAllUnreadChat(String id) {
		return chatDAO.selectAllUnreadChat(id);
	}

	@Override
	public List<int[]> getUnreadChat(String fromId, String toId) {
		return chatDAO.selectUnreadChat(fromId, toId);
	}

}
