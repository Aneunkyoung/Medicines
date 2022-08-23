package com.medicines.service;

import java.util.List;

import com.medicines.dto.User;
import com.medicines.exception.DeleteAccountFailException;
import com.medicines.exception.ExistsEmailException;
import com.medicines.exception.ExistsIdException;
import com.medicines.exception.ExistsPhoneException;
import com.medicines.exception.FindIdFailException;
import com.medicines.exception.FindPasswordFailException;
import com.medicines.exception.LoginAuthFailException;
import com.medicines.exception.UserNotFoundException;

public interface UserService {
	void addUser(User user) throws ExistsIdException, ExistsEmailException, ExistsPhoneException;
	void getAuth(User user) throws LoginAuthFailException;
	void modifyAuthKey(String id, String authKey);
	void modifyAuthStatus(String id); 
	void modifyPassword(String id, String password); 
	void modifyUserInfo(User user) throws UserNotFoundException;
	void modifyUserProfile(User user);
	void removeUserAccount(String id, String password) throws DeleteAccountFailException;
	User getUserById(String id) throws UserNotFoundException;
	User getUserByEmail(String email);
	User getUserByPhone(String phone);
	User findId(String name, String email) throws FindIdFailException;
	User findPassword(String id, String email) throws FindPasswordFailException;
	List<User> getUserList();
	List<User> getAllUserList(String findfriend);
}
