package com.medicines.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.HtmlUtils;

import com.medicines.dto.Chat;
import com.medicines.dto.User;
import com.medicines.exception.UserNotFoundException;
import com.medicines.service.ChatService;
import com.medicines.service.UserService;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/myChat")
	public String chat(HttpSession session, Model model) throws UserNotFoundException {
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null) { 
			return "redirect:/"; 
		}
		String id=user.getId();
	
		model.addAttribute("chatList", chatService.getChatListByRecent(id));
		model.addAttribute("userInfo", userService.getUserById(id));
		
		return "chat/myChat";
	}
	
	@RequestMapping("/chat/{id}")
	public String chat(@PathVariable String id, Model model, HttpSession session) throws UserNotFoundException {
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null) { 
			return "redirect:/login"; 
		}
		model.addAttribute("uInfo", userService.getUserById(id));		
		return "chat/chat";
	}
	
	@RequestMapping(value = "chatList/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> chatList(String myId, @PathVariable String id, String number, HttpSession session) throws UserNotFoundException {
		User user = (User) session.getAttribute("loginUser");
		myId=user.getId();
		number="0";
		
		Map<String, Object> returnMap=new HashMap<String, Object>();
		returnMap.put("chatList", chatService.getChatListById(myId, id, number));
		chatService.modifyChatRead(myId, id);
		return returnMap; 
	}
	
	@RequestMapping(value = "chat_send", method = RequestMethod.POST)
	@ResponseBody
	public String chat_send(@RequestBody Chat chat) {
		chat.setChatContent(HtmlUtils.htmlEscape(chat.getChatContent()));
		chatService.addChat(chat);
		return "success";
	}
	
	
	@RequestMapping(value = "findFriends")
	@ResponseBody
	public List<User> findFriends(String findfriend) {
		List<User> friendSearchList = null;
		friendSearchList=userService.getAllUserList(findfriend);
		return friendSearchList; 
	}
	
	@RequestMapping(value = "chatUnreadNum")
	@ResponseBody
	public int chatUnreadNum(String uid) {
		int result = chatService.getAllUnreadChat(uid);
		return result;
	}
}
