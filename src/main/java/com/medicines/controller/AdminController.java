package com.medicines.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medicines.dto.User;
import com.medicines.service.AdminService;
import com.medicines.util.Pager;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin", method = RequestMethod.GET) 
	public String displayAdmin(HttpSession session) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		return "admin/admin";  
	} 
	
	@RequestMapping(value="/admin_user") 
	public String displayUser(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "id") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalUser=adminService.getUserCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalUser, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("userList", adminService.getUserLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/user"; 
	} 
	
	@RequestMapping(value="/admin_userStatusChange") 
	public String changeUserStatus(HttpSession session, @RequestParam("id") String id, @RequestParam("status") int status, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}

		adminService.modifyUserStatus(status, id);
		
		return "redirect:/admin_user";
	} 
	
	@RequestMapping(value="/admin_authStatusChange") 
	public String changeAuthStatus(HttpSession session, @RequestParam("id") String id, @RequestParam("status") int status, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		adminService.modifyAuthStatus(status, id);
		
		return "redirect:/admin_user";
	} 
	
	@RequestMapping(value="/admin_drugs") 
	public String displayDrug(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "itemSeq") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalDrug=adminService.getDrugCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalDrug, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("drugList", adminService.getDrugLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/drugs"; 
	} 
	
	@RequestMapping(value="/admin_drugsRemove") 
	public String removeDrug(HttpSession session, HttpServletRequest request) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		String[] checkItemSeq = request.getParameterValues("checkItemSeq");
		for(String itemSeq:checkItemSeq) {
			adminService.removeDrug(itemSeq);
		}
		
		return "redirect:/admin_drugs";
	} 
	
	@RequestMapping(value="/admin_notice") 
	public String displayNotice(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalDrug=adminService.getNoticeCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalDrug, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("noticeList", adminService.getNoticeLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/notice"; 
	} 
	
	@RequestMapping(value="/admin_noticeRemove") 
	public String removeNotice(HttpSession session, HttpServletRequest request) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		String[] checkNum = request.getParameterValues("checkNum");
		for(String num:checkNum) {
			adminService.removeNotice(Integer.parseInt(num));
		}
		
		return "redirect:/admin_notice";
	} 
	
	@RequestMapping(value="/admin_board", method = RequestMethod.GET) 
	public String displayBoard(HttpSession session, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		model.addAttribute("board", adminService.getBoardList());
		model.addAttribute("boardComment", adminService.getBoardCommentList());
		return "admin/board"; 
	} 
	
	@RequestMapping(value="/admin_boardList") 
	public String displayBoardList(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalBoard=adminService.getBoardCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("boardList", adminService.getBoardLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/boardList"; 
	} 
	
	@RequestMapping(value="/admin_boardRemove") 
	public String removeBoard(HttpSession session, HttpServletRequest request) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		String[] checkNum = request.getParameterValues("checkNum");
		for(String num:checkNum) {
			adminService.removeBoard(Integer.parseInt(num));
		}
		
		return "redirect:/admin_boardList";
	} 
	
	@RequestMapping(value="/admin_boardCommentList") 
	public String displayBoardCommentList(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "content") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalBoardComment=adminService.getBoardCommentCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoardComment, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("boardCommentList", adminService.getBoardCommentLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/boardCommentList"; 
	} 
	
	@RequestMapping(value="/admin_boardCommentRemove") 
	public String removeBoardComment(HttpSession session, HttpServletRequest request) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		String[] checkNo = request.getParameterValues("checkNo");
		for(String no:checkNo) {
			adminService.removeBoardComment(Integer.parseInt(no));
		}
		
		return "redirect:/admin_boardCommentList";
	} 
	
	@RequestMapping(value="/admin_question", method = RequestMethod.GET) 
	public String displayQuestion(HttpSession session, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		model.addAttribute("question", adminService.getQuestionList());
		model.addAttribute("questionComment", adminService.getQuestionCommentList());
		return "admin/question"; 
	} 
	
	@RequestMapping(value="/admin_questionList") 
	public String displayQuestionList(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalQuestion=adminService.getQuestionCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalQuestion, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("questionList", adminService.getQuestionLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/questionList"; 
	} 
	
	@RequestMapping(value="/admin_questionRemove") 
	public String removeQuestion(HttpSession session, HttpServletRequest request) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		String[] checkNum = request.getParameterValues("checkNum");
		for(String num:checkNum) {
			adminService.removeQuestion(Integer.parseInt(num));
		}
		
		return "redirect:/admin_questionList";
	} 
	

	@RequestMapping(value="/admin_questionCommentList") 
	public String displayQuestionCommentList(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "content") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		int totalQuestionComment=adminService.getQuestionCommentCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalQuestionComment, pageSize, blockSize); 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("questionCommentList", adminService.getQuestionCommentLists(pagerMap));
		model.addAttribute("pager", pager);
		
		return "admin/questionCommentList"; 
	} 
	
	@RequestMapping(value="/admin_questionCommentRemove") 
	public String removeQuestionComment(HttpSession session, HttpServletRequest request) { 
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		
		String[] checkNo = request.getParameterValues("checkNo");
		for(String no:checkNo) {
			adminService.removeQuestionComment(Integer.parseInt(no));
		}
		
		return "redirect:/admin_questionCommentList";
	} 
	
}
