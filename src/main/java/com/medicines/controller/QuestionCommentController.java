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
import com.medicines.dto.QuestionComment;
import com.medicines.dto.User;
import com.medicines.service.CommentService;
import com.medicines.service.QuestionCommentService;
import com.medicines.service.QuestionService;

@Controller
public class QuestionCommentController {
	@Autowired
	private QuestionCommentService questionCommentService;
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value="/question_comment_view/{no}", method = RequestMethod.GET) 
	@ResponseBody 
	public QuestionComment commentView(@PathVariable int no, HttpSession session) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || !loginUser.getId().equals(questionCommentService.getQuestionCommentByNo(no).getId())) {
			return null;
		}
		return questionCommentService.getQuestionCommentByNo(no);
	} 
	
	/*댓글 변경*/  
	@RequestMapping(value="/question_comment_modify", method = {RequestMethod.PUT, RequestMethod.PATCH}) 
	@ResponseBody public String CommentModify(@RequestBody QuestionComment comment) { 
		questionCommentService.modifyQuestionComment(comment); 
		return "success"; 
	} 

	
	/*댓글 작성*/
	@RequestMapping(value = "/question_comment_write/{num}", method=RequestMethod.POST)
	public String commentWrite(@PathVariable int num, QuestionComment comment, HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || !loginUser.getId().equals(questionService.getQuestion(num).getId()) && loginUser.getUserStatus()!=9) {
			redirectAttributes.addFlashAttribute("message", "잘못된 접근입니다.");
			return "redirect:/question_view?num="+num;  
		} 
		
		comment.setId(loginUser.getId());
		comment.setWriter(loginUser.getName());
		comment.setQuestionNo(num);
		questionCommentService.addQuestionComment(comment);
		
		return "redirect:/question_view?num="+num; 
	}
	
	
	/*댓글 삭제*/
	@RequestMapping("/removeQuestionComment/{no}")
	public String removeComment(@PathVariable int no, QuestionComment comment, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		int num=questionCommentService.getQuestionCommentByNo(no).getQuestionNo();
		if (user==null || !user.getId().equals(questionCommentService.getQuestionCommentByNo(no).getId()) || !(user.getUserStatus()==9)) {
			return "redirect:/question_view?num="+num; 
		}
		
		questionCommentService.removeQuestionComment(no);
		return "redirect:/question_view?num="+num; 
	}
}
