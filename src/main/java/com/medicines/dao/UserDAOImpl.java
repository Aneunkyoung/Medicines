package com.medicines.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.User;
import com.medicines.mapper.UserMapper;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertUser(User user) {
		return sqlSession.getMapper(UserMapper.class).insertUser(user);
	}

	@Override
	public User selectUserById(String id) {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(UserMapper.class).selectUserById(id);
	}
	
	@Override
	public User selectUserByEmail(String email) {
		return sqlSession.getMapper(UserMapper.class).selectUserByEmail(email);
	}
	
	@Override
	public User selectUserByPhone(String phone) {
		return sqlSession.getMapper(UserMapper.class).selectUserByPhone(phone);
	}

	@Override
	public List<User> selectUserList() {
		return sqlSession.getMapper(UserMapper.class).selectUserList();
	}

	@Override
	public int updateAuthKey(String id, String authKey) {
		return sqlSession.getMapper(UserMapper.class).updateAuthKey(id, authKey);
	}

	@Override
	public int updateAuthStatus(String id) {
		return sqlSession.getMapper(UserMapper.class).updateAuthStatus(id);
	}

	@Override
	public User findId(String name, String email) {
		return sqlSession.getMapper(UserMapper.class).findId(name, email);
	}

	@Override
	public User findPassword(String id, String email) {
		return sqlSession.getMapper(UserMapper.class).findPassword(id, email);
	}

	@Override
	public int updatePassword(String id, String password) {
		return sqlSession.getMapper(UserMapper.class).updatePassword(id, password);
	}

	@Override
	public int updateUserInfo(User user) {
		return sqlSession.getMapper(UserMapper.class).updateUserInfo(user);
	}
	
	@Override
	public int updateUserProfile(User user) {
		return sqlSession.getMapper(UserMapper.class).updateUserProfile(user);
	}

	@Override
	public int deleteUserAccount(String id, String password) {
		return sqlSession.getMapper(UserMapper.class).deleteUserAccount(id, password);
	}

	@Override
	public List<User> selectAllUserList(String findfriend) {
		return sqlSession.getMapper(UserMapper.class).selectAllUserList(findfriend);
	}

}
