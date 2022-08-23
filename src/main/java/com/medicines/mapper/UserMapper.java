package com.medicines.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.User;

public interface UserMapper {
	/*회원가입*/
	int insertUser(User user);
	/*인증키 변경*/
	int updateAuthKey(@Param("id") String id, @Param("authKey") String authKey);
	/*인증상태 변경*/
	int updateAuthStatus(String id);
	/*비밀번호 변경*/
	int updatePassword(@Param("id") String id, @Param("password")String password);
	/*회원정보 변경*/
	int updateUserInfo(User user);
	/* 회원가입시 프로필 변경 */
	int updateUserProfile(User user);
	/*회원 탈퇴*/
	int deleteUserAccount(@Param("id") String id, @Param("password")String password);
	/*아이디로 회원찾기*/
	User selectUserById(String id);
	/*이메일로 회원찾기*/
	User selectUserByEmail(String email);
	/*전화번호로 회원찾기*/
	User selectUserByPhone(String phone);
	/*아이디 찾기*/
	User findId(@Param("name") String name, @Param("email") String email);
	/*비밀번호 찾기*/
	User findPassword(@Param("id") String id, @Param("email") String email);
	
	List<User> selectUserList();
	List<User> selectAllUserList(String findfriend);
}
