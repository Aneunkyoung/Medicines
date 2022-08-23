package com.medicines.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medicines.dto.Comment;
import com.medicines.dto.User;
import com.medicines.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/comment_view/{no}", method = RequestMethod.GET) 
	@ResponseBody 
	public Comment commentView(@PathVariable int no, HttpSession session) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || !loginUser.getId().equals(commentService.getCommentByNo(no).getId())) {
			return null;
		}
		return commentService.getCommentByNo(no);
	} 
	
	/*댓글 변경*/  
	@RequestMapping(value="/comment_modify", method = {RequestMethod.PUT, RequestMethod.PATCH}) 
	@ResponseBody public String CommentModify(@RequestBody Comment comment) { 
		commentService.modifyComment(comment); 
		return "success"; 
	} 

	
	/*댓글 작성*/
	@RequestMapping(value = "/comment_write/{num}", method=RequestMethod.POST)
	public String commentWrite(@PathVariable int num, Comment comment, HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null) {
			redirectAttributes.addFlashAttribute("message", "글쓰기는 로그인 후 사용할 수 있습니다.");
			return "redirect:/board_view?num="+num;  
		}
		
		comment.setId(loginUser.getId());
		comment.setWriter(loginUser.getName());
		comment.setBoardNo(num); 
		commentService.addComment(comment);
		
		return "redirect:/board_view?num="+num; 
	}
	
	
	/*댓글 삭제*/
	@RequestMapping("/removeComment/{no}")
	public String removeComment(@PathVariable int no, Comment comment, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		int num=commentService.getCommentByNo(no).getBoardNo();
		if (user==null || !user.getId().equals(commentService.getCommentByNo(no).getId())) {
			return "redirect:/board_view?num="+num; 
		}
		
		commentService.removeComment(no);
		return "redirect:/board_view?num="+num; 
	}
}
