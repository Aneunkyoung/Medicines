package com.medicines.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.util.HtmlUtils;

import com.medicines.dto.NoticeBoard;
import com.medicines.dto.User;
import com.medicines.service.NoticeBoardService;
import com.medicines.util.Pager;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@Autowired
	private WebApplicationContext context; 
	
	/*게시글 출력*/
	@RequestMapping(value = "/notice")
	public String noticeList(@RequestParam(defaultValue = "1")int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, Model model) {
		int totalBoard=noticeBoardService.getNoticeBoardCount(search_option, keyword);
		int pageSize=10;
		int blockSize=5;
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pagerMap=new HashMap<String, Object>();
		pagerMap.put("search_option", search_option);
		pagerMap.put("keyword", keyword);
		pagerMap.put("startRow", pager.getStartRow());
		pagerMap.put("endRow", pager.getEndRow());
		
		model.addAttribute("noticeList", noticeBoardService.getNoticeBoardList(pagerMap));
		model.addAttribute("pager", pager);
		return "notice/notice_list";
	}
	
	/*게시글 작성*/
	@RequestMapping(value = "/notice_write", method = RequestMethod.GET)
	public String noticeWrite(HttpSession session) {
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null || user.getUserStatus()!=9) { 
			return "redirect:/notice"; 
		} 
		return "notice/notice_write";
	}
	
	@RequestMapping(value = "/notice_write", method = RequestMethod.POST)
	public String noticeWrite(@ModelAttribute NoticeBoard noticeBoard, MultipartFile uploadNoticeFile, HttpSession session, MultipartRequest multipartRequest, Model model) throws IllegalStateException, IOException {
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null || user.getUserStatus()!=9) { 
			return "redirect:/notice"; 
		} 
		String uploadDir = context.getServletContext().getRealPath("/WEB-INF/noticeImg");
		String originFilename=uploadNoticeFile.getOriginalFilename();
		String uploadFilename=System.currentTimeMillis()+"";
		
		uploadNoticeFile.transferTo(new File(uploadDir, uploadFilename));   
		
		noticeBoard.setOrigin(originFilename);
		noticeBoard.setUpload(uploadFilename);
		noticeBoard.setContent(HtmlUtils.htmlEscape(noticeBoard.getContent()));
		 
		noticeBoardService.addNoticeBoard(noticeBoard);
		
		return "redirect:/notice_view?num="+noticeBoard.getNum();
	}
	
	/*게시글 상세 출력*/
	@RequestMapping(value = "/notice_view", method = RequestMethod.GET)
	public String noticeView(@RequestParam int num, Model model) {
		noticeBoardService.modifyReadCount(num);
		model.addAttribute("notice", noticeBoardService.getNoticeBoard(num));
		return "notice/notice_view";
	}
	
	
	/*게시글 변경*/
	@RequestMapping(value = "/notice_modify/{num}", method = RequestMethod.GET)
	public String updateNoticeBoard(@PathVariable int num, HttpSession session, Model model) { 
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null || user.getUserStatus()!=9) { 
			return "redirect:/notice"; 
		} 
		model.addAttribute("notice", noticeBoardService.getNoticeBoard(num)); 
		return "notice/notice_modify"; 
	}

	@RequestMapping(value = "/notice_modify/{num}", method = RequestMethod.POST) 
	public String updateNoticeBoard(@PathVariable int num, HttpSession session, NoticeBoard noticeBoard, MultipartFile uploadNoticeFile) throws IOException { 
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null || user.getUserStatus()!=9) { 
			return "redirect:/notice"; 
		} 
		String uploadDir = context.getServletContext().getRealPath("/WEB-INF/noticeImg");
		String originFilename=uploadNoticeFile.getOriginalFilename();
		String uploadFilename=System.currentTimeMillis()+"";
		
		if (uploadNoticeFile.isEmpty()) { 
			noticeBoard.setOrigin(noticeBoard.getOrigin());
			noticeBoard.setUpload(noticeBoard.getUpload());		
			noticeBoard.setContent(HtmlUtils.htmlEscape(noticeBoard.getContent()));
		} else { 
			noticeBoard.setOrigin(originFilename);
			noticeBoard.setUpload(uploadFilename);		
			noticeBoard.setContent(HtmlUtils.htmlEscape(noticeBoard.getContent()));
			uploadNoticeFile.transferTo(new File(uploadDir, uploadFilename)); 
		} 
		noticeBoardService.modifyNoticeBoard(noticeBoard);
		return "redirect:/notice_view?num="+num; 
	}

	
	/*게시글 삭제*/
	@RequestMapping("remove_notice/{num}") 
	public String removeNoticeBoard(@PathVariable int num, HttpSession session) { 	
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null || user.getUserStatus()!=9) {  
			return "redirect:/notice"; 
		} 
		
		NoticeBoard noticeBoard=noticeBoardService.getNoticeBoard(num);
		if (noticeBoard.getUpload()!=null) { 
			String uploadDir=context.getServletContext().getRealPath("/WEB-INF/noticeImg"); 
			new File(uploadDir,noticeBoard.getUpload()).delete(); 
		} 
		
		noticeBoardService.removeNoticeBoard(num); 
		return "redirect:/notice"; 
	}

	
	/*파일 다운로드*/
	@RequestMapping("/file_download/{num}") 
	public String fileDownload(@PathVariable int num, Model model) { 
		NoticeBoard noticeBoard=noticeBoardService.getNoticeBoard(num);
		model.addAttribute("uploadDir", context.getServletContext().getRealPath("/WEB-INF/noticeImg")); 
		model.addAttribute("uploadFileName", noticeBoard.getUpload()); 
		model.addAttribute("originFileName", noticeBoard.getOrigin()); 
		return "fileDownload"; 
	}
	
	
	/*파일 삭제*/
	@RequestMapping(value = "delete_file/{num}")
	public String removeFile(@PathVariable int num, Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser"); 
		if (user==null || user.getUserStatus()!=9) { 
			return "redirect:/notice"; 
		} 
		NoticeBoard noticeBoard=noticeBoardService.getNoticeBoard(num);
		if (noticeBoard.getUpload()!=null) { 
			String uploadDir=context.getServletContext().getRealPath("/WEB-INF/noticeImg"); 
			new File(uploadDir,noticeBoard.getUpload()).delete(); 
		} 
		
		noticeBoardService.removeFile(num);
		model.addAttribute("notice", noticeBoardService.getNoticeBoard(num)); 
		return "notice/notice_modify";
	}
}
