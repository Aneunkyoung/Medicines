package com.medicines.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import com.medicines.dto.Question;
import com.medicines.dto.User;
import com.medicines.exception.UserNotFoundException;
import com.medicines.service.QuestionService;
import com.medicines.service.CommentService;
import com.medicines.service.QuestionCommentService;
import com.medicines.util.Pager;

@Controller
public class QuestionController {
	@Autowired 
	private QuestionService questionService;
	
	@Autowired
	private QuestionCommentService questionCommentService;
	
	@Autowired
	private WebApplicationContext context;
	
	/*모든 문의사항 출력*/
	@RequestMapping(value = "/question") 
	public String questionList(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) {
		int totalQuestion=questionService.getQuestionCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalQuestion, pageSize, blockSize); 
		 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		 
		model.addAttribute("questionList", questionService.getQuestionUserList(pagerMap));
		model.addAttribute("pager", pager);
		return "question/question_list"; 		
	}	
	
	
	/*문의사항 작성*/
	@RequestMapping(value = "/question_write",method = RequestMethod.GET)
	public String questionWrite(HttpSession session, RedirectAttributes redirectAttributes) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null) { 
			redirectAttributes.addFlashAttribute("message", "글쓰기는 로그인 후 사용할 수 있습니다.");
			return "redirect:/question";
		}
		return "question/question_write";
	}
	
	@RequestMapping(value = "/question_write",method = RequestMethod.POST)
	public String questionWrite(@ModelAttribute Question question, HttpSession session, Model model, MultipartFile uploadQuestionFile) throws IOException {
		String uploadDir=context.getServletContext().getRealPath("/WEB-INF/questionImg");
		String fileName=uploadQuestionFile.getOriginalFilename();
		
		User user = (User) session.getAttribute("loginUser");
		fileName=user.getId()+System.currentTimeMillis();
		File file=new File(uploadDir, fileName);
		uploadQuestionFile.transferTo(file);
		if (uploadQuestionFile.isEmpty()) {
			question.setImg(null);
		} else {			
			question.setImg(fileName);
		}
		question.setContent(HtmlUtils.htmlEscape(question.getContent()));
		question.setStatus(question.getStatus());
		questionService.addQuestion(question);
		return "redirect:/question_view?num="+question.getNum(); 
	}
	
	
	/*문의사항 상세페이지*/
	@RequestMapping("/question_view") 
	public String view(@RequestParam int num, @RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) throws UserNotFoundException { 
		if (questionService.getQuestion(num).getStatus()==1) {
			User user = (User) session.getAttribute("loginUser");
			if (user==null || !user.getId().equals(questionService.getQuestion(num).getId()) && user.getUserStatus()!=9) {
				return "redirect:/question";
			}
		}
		questionService.modifyReadCount(num);
		model.addAttribute("question", questionService.getQuestion(num)); 
		
		int totalBoard=questionCommentService.getQuestionCommentCount(num);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("num", num); 
		pagerMap.put("startRow", pager.getStartRow()); 
		pagerMap.put("endRow", pager.getEndRow()); 
		
		
		model.addAttribute("commentList", questionCommentService.getQuestionCommentList(pagerMap));
		model.addAttribute("commentcount", questionCommentService.getQuestionCommentCount(num));
		model.addAttribute("pager", pager);
		
		return "question/question_view"; 
	}

	
	/*문의사항 변경*/
	@RequestMapping(value = "/question_modify/{num}", method = RequestMethod.GET)
	public String updatequestion(@PathVariable int num, HttpSession session, Model model) {   
		User user = (User) session.getAttribute("loginUser");
		if (!user.getId().equals(questionService.getQuestion(num).getId()) && !(user.getUserStatus()==9)) {
			return "redirect:/question";
		}
		model.addAttribute("question", questionService.getQuestion(num));
		return "question/question_modify"; 
	} 
	
	@RequestMapping(value = "/question_modify/{num}", method = RequestMethod.POST)
	public String updatequestion(@PathVariable int num, HttpSession session, Question question,  MultipartFile uploadQuestionFile) throws IOException {
		User user = (User) session.getAttribute("loginUser");
		if (!user.getId().equals(questionService.getQuestion(num).getId()) && !(user.getUserStatus()==9)) {
			return "redirect:/question";
		}
		String uploadDir=context.getServletContext().getRealPath("/WEB-INF/questionImg");
		String fileName=uploadQuestionFile.getOriginalFilename();
		
		fileName=user.getId()+System.currentTimeMillis();
		File file=new File(uploadDir, fileName);
		uploadQuestionFile.transferTo(file);
		
		if (uploadQuestionFile.isEmpty()) {
			question.setImg(question.getImg());
		} else{
			question.setImg(fileName);	
		}
		question.setContent(HtmlUtils.htmlEscape(question.getContent()));
		question.setStatus(question.getStatus());
		questionService.modifyQuestion(question);
		return "redirect:/question_view?num="+num; 
	}
	
	
	/*문의사항 삭제*/
	@RequestMapping("removeQuestion/{num}")
	public String removequestion(@PathVariable int num, Question question, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (!user.getId().equals(questionService.getQuestion(num).getId()) && !(user.getUserStatus()==9)) {
			return "redirect:/question";
		}
		Question questions=questionService.getQuestion(num);
		if (question.getImg()!=null) {
			String uploadDir=context.getServletContext().getRealPath("/WEB-INF/questionImg");
			new File(uploadDir,questions.getImg()).delete();			
		}
		
		questionService.removeQuestion(num);
		return "redirect:/question"; 
	}
}
