package com.medicines.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.medicines.dao.UserDAO;
import com.medicines.dto.User;
import com.medicines.exception.DeleteAccountFailException;
import com.medicines.exception.ExistsEmailException;
import com.medicines.exception.ExistsIdException;
import com.medicines.exception.ExistsPhoneException;
import com.medicines.exception.FindIdFailException;
import com.medicines.exception.FindPasswordFailException;
import com.medicines.exception.LoginAuthFailException;
import com.medicines.exception.UserNotFoundException;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpSession session;

	@Transactional
	@Override
	public void addUser(User user) throws ExistsIdException, ExistsEmailException, ExistsPhoneException {
		if (userDAO.selectUserById(user.getId())!=null) {
			throw new ExistsIdException("이미 사용중인 아이디 입니다.", user);
		}
		if (userDAO.selectUserByEmail(user.getEmail())!=null) {
			throw new ExistsEmailException("이미 사용중인 이메일 입니다.", user);
		}
		if (userDAO.selectUserByPhone(user.getPhone())!=null) {
			throw new ExistsPhoneException("이미 사용중인 전화번호 입니다.", user);
		}
		
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
		
		userDAO.insertUser(user);
	}

	@Override
	public User getUserById(String id){
		return userDAO.selectUserById(id);
	}
	
	@Override
	public User getUserByEmail(String email) {
		return userDAO.selectUserByEmail(email);
	}
	
	@Override
	public User getUserByPhone(String phone) {
		return userDAO.selectUserByPhone(phone);
	}
	
	@Override
	public void getAuth(User user) throws LoginAuthFailException{
		User authuser=userDAO.selectUserById(user.getId());
		if (authuser==null) {
			throw new LoginAuthFailException("아이디 또는 비밀번호가 맞지 않습니다.", user.getId());
			// 아이디의 회원정보가 없을때 : 보안을 위해 아이디가 존재하는지 안하는지 여부를 알려주지 않는다.
		} 
		if (!BCrypt.checkpw(user.getPassword(), authuser.getPassword())) {			
			throw new LoginAuthFailException("아이디 또는 비밀번호가 맞지 않습니다.", user.getId());
		}
		if (authuser.getAuthStatus()!=1) {
			throw new LoginAuthFailException("이메일 인증을 완료하지 않았습니다. 로그인을 위해 인증을 완료해주세요.", user.getId());
		}
		
		if (authuser.getUserStatus()==5) {
			throw new LoginAuthFailException("탈퇴한 회원입니다.", user.getId());
		}
	}

	@Override
	public List<User> getUserList() {
		return userDAO.selectUserList();
	}

	@Transactional
	@Override
	public void modifyAuthKey(String id, String authKey) {
		userDAO.updateAuthKey(id, authKey);
	}

	@Transactional
	@Override
	public void modifyAuthStatus(String id) {
		userDAO.updateAuthStatus(id);
	}

	@Override
	public User findId(String name, String email) throws FindIdFailException {
		if (userDAO.findId(name, email)==null) {
			throw new FindIdFailException("이름 혹은 이메일을 다시 확인해주세요.", name, email);
		}
		return userDAO.findId(name, email);
	}

	@Override
	public User findPassword(String id, String email) throws FindPasswordFailException {
		if (userDAO.findPassword(id, email)==null) {
			throw new FindPasswordFailException("아이디 혹은 이메일을 다시 확인해주세요.", id, email);
		}
		return userDAO.findPassword(id, email);
	}

	@Override
	public void modifyPassword(String id, String password) {
		userDAO.updatePassword(id, password);
	}

	@Transactional
	@Override
	public void modifyUserInfo(User user) throws UserNotFoundException {
		if (userDAO.selectUserById(user.getId())==null) {
			throw new UserNotFoundException("회원정보가 존재하지 않습니다.", user);
		}
		
		String password=user.getPassword(); 
		
		if (password!=null && !password.equals("")) { 
			user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt())); 
		}
		
		if (password==null || password.equals("")) {
			password=user.getPassword();
		}
		
		userDAO.updateUserInfo(user);
	}
	
	@Transactional
	@Override
	public void modifyUserProfile(User user){
		userDAO.updateUserProfile(user);
	}

	@Transactional
	@Override
	public void removeUserAccount(String id, String password) throws DeleteAccountFailException {
		User loginUser=(User) session.getAttribute("loginUser");
		
		if (BCrypt.checkpw(password, loginUser.getPassword())!=true) {
			throw new DeleteAccountFailException("비밀번호가 올바르지 않습니다. 비밀번호를 다시 확인해주세요.", id);
		} else {
			password=userDAO.selectUserById(id).getPassword();
			userDAO.deleteUserAccount(id, password);
		}	
	}

	@Override
	public List<User> getAllUserList(String findfriend) {
		return userDAO.selectAllUserList(findfriend);
	}
}
