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

import com.medicines.dto.Board;
import com.medicines.dto.User;
import com.medicines.exception.UserNotFoundException;
import com.medicines.service.BoardService;
import com.medicines.service.CommentService;
import com.medicines.util.Pager;

@Controller
public class BoardController {
	@Autowired 
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private WebApplicationContext context;
	
	/*모든 게시글 출력*/
	@RequestMapping(value = "/board") 
	public String boardList(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) {
		int totalBoard=boardService.getBoardCount(search_option, keyword);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		 
		model.addAttribute("boardList", boardService.getBoardUserList(pagerMap));
		model.addAttribute("pager", pager);
		return "board/board_list"; 		
	}	
	
	
	/*게시글 작성*/
	@RequestMapping(value = "/board_write",method = RequestMethod.GET)
	public String boardWrite(HttpSession session, RedirectAttributes redirectAttributes) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null) { 
			redirectAttributes.addFlashAttribute("message", "글쓰기는 로그인 후 사용할 수 있습니다.");
			return "redirect:/board";
		}
		return "board/board_write";
	}
	
	@RequestMapping(value = "/board_write",method = RequestMethod.POST)
	public String boardWrite(@ModelAttribute Board board, HttpSession session, Model model, MultipartFile uploadBoardFile) throws IOException {
		String uploadDir=context.getServletContext().getRealPath("/WEB-INF/boardImg");
		String fileName=uploadBoardFile.getOriginalFilename();
		
		User user = (User) session.getAttribute("loginUser");
		fileName=user.getId()+System.currentTimeMillis();
		File file=new File(uploadDir, fileName);
		uploadBoardFile.transferTo(file);
		if (uploadBoardFile.isEmpty()) {
			board.setImg(null);
		} else {			
			board.setImg(fileName);
		}
		board.setContent(HtmlUtils.htmlEscape(board.getContent()));
		boardService.addBoard(board);
		return "redirect:/board_view?num="+board.getNum(); 
	}
	
	
	/*게시글 상세페이지*/
	@RequestMapping("/board_view") 
	public String view(@RequestParam int num, @RequestParam(defaultValue = "1") int pageNum, Model model) throws UserNotFoundException { 
		boardService.modifyReadCount(num);
		model.addAttribute("board", boardService.getBoard(num)); 
		
		int totalBoard=commentService.getCommentCount(num);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("num", num); 
		pagerMap.put("startRow", pager.getStartRow()); 
		pagerMap.put("endRow", pager.getEndRow()); 
		
		
		model.addAttribute("commentList", commentService.getCommentList(pagerMap));
		model.addAttribute("commentcount", commentService.getCommentCount(num));
		model.addAttribute("pager", pager);
		return "board/board_view"; 
	}
	
	
	/*게시글 변경*/
	@RequestMapping(value = "/board_modify/{num}", method = RequestMethod.GET)
	public String updateBoard(@PathVariable int num, HttpSession session, Model model) {   
		User user = (User) session.getAttribute("loginUser");
		if (!user.getId().equals(boardService.getBoard(num).getId()) && !(user.getUserStatus()==9)) {
			return "redirect:/board";
		}
		model.addAttribute("board", boardService.getBoard(num));
		return "board/board_modify"; 
	} 
	
	@RequestMapping(value = "/board_modify/{num}", method = RequestMethod.POST)
	public String updateBoard(@PathVariable int num, HttpSession session, Board board,  MultipartFile uploadBoardFile) throws IOException {
		User user = (User) session.getAttribute("loginUser");
		if (!user.getId().equals(boardService.getBoard(num).getId()) && !(user.getUserStatus()==9)) {
			return "redirect:/board";
		}
		String uploadDir=context.getServletContext().getRealPath("/WEB-INF/boardImg");
		String fileName=uploadBoardFile.getOriginalFilename();
		
		fileName=user.getId()+System.currentTimeMillis();
		File file=new File(uploadDir, fileName);
		uploadBoardFile.transferTo(file);
		
		if (uploadBoardFile.isEmpty()) {
			board.setImg(board.getImg());
			System.out.println("파일이름1="+board.getImg());
		} else{
			board.setImg(fileName);
			System.out.println("파일이름2="+fileName);
		}
		boardService.modifyBoard(board);
		return "redirect:/board_view?num="+num; 
	}
	
	
	/*게시글 삭제*/
	@RequestMapping("removeBoard/{num}")
	public String removeBoard(@PathVariable int num, Board board, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (!user.getId().equals(boardService.getBoard(num).getId()) && !(user.getUserStatus()==9)) {
			return "redirect:/board";
		}
		Board boards=boardService.getBoard(num);
		if (board.getImg()!=null) {
			String uploadDir=context.getServletContext().getRealPath("/WEB-INF/boardImg");
			new File(uploadDir,boards.getImg()).delete();			
		}
		
		boardService.removeBoard(num);
		return "redirect:/board"; 
	}
}
