package com.medicines.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.Chat;
import com.medicines.mapper.ChatMapper;

@Repository
public class ChatDAOImpl implements ChatDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertChat(Chat chat) {
		return sqlSession.getMapper(ChatMapper.class).insertChat(chat);
	}

	@Override
	public List<Chat> selectChatListById(String fromId, String toId, String chatId) {
		return sqlSession.getMapper(ChatMapper.class).selectChatListById(fromId, toId, chatId);
	}

	@Override
	public List<Chat> selectChatListByRecent(String id) {
		return sqlSession.getMapper(ChatMapper.class).selectChatListByRecent(id);
	}

	@Override
	public int updateChatRead(String fromId, String toId) {
		return sqlSession.getMapper(ChatMapper.class).updateChatRead(fromId, toId);
	}

	@Override
	public int selectAllUnreadChat(String id) {
		return sqlSession.getMapper(ChatMapper.class).selectAllUnreadChat(id);
	}

	@Override
	public List<int[]> selectUnreadChat(String fromId, String toId) {
		return sqlSession.getMapper(ChatMapper.class).selectUnreadChat(fromId, toId);
	}


}
