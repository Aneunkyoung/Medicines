package com.medicines.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medicines.dto.User;
import com.medicines.exception.DeleteAccountFailException;
import com.medicines.exception.ExistsEmailException;
import com.medicines.exception.ExistsIdException;
import com.medicines.exception.ExistsPhoneException;
import com.medicines.exception.FindIdFailException;
import com.medicines.exception.FindPasswordFailException;
import com.medicines.exception.LoginAuthFailException;
import com.medicines.exception.UserNotFoundException;
import com.medicines.service.BoardService;
import com.medicines.service.ChatService;
import com.medicines.service.CommentService;
import com.medicines.service.QuestionCommentService;
import com.medicines.service.QuestionService;
import com.medicines.service.UserService;
import com.medicines.util.AuthKey;
import com.medicines.util.EmailSend;
import com.medicines.util.Pager;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private QuestionCommentService questionCommentService;

	
	@Autowired
	private WebApplicationContext context;
	
	/*-----회원가입-----*/
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join_form";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute User user, Model model, HttpServletRequest request) throws ExistsIdException, ExistsEmailException, ExistsPhoneException, UserNotFoundException, IOException {	
			userService.addUser(user);
			
			User userAuth = userService.getUserById(user.getId());
			String url=request.getRequestURL().toString().replace("join", "");
			String authKey=new AuthKey().getKey(20, false);
			
			ApplicationContext context=new ClassPathXmlApplicationContext("email.xml");	
			EmailSend bean = context.getBean("emailSend", EmailSend.class);
			bean.sendEmail(userAuth.getEmail(), "Medicines 본인인증", userAuth.getName()+"님 안녕하세요! 회원가입을 위해 하단의 url을 눌러주세요.<br><a href='"+url+"emailConfirm/"+userAuth.getId()+"/"+authKey+"'>인증하기</a>");
			((ClassPathXmlApplicationContext)context).close();		
			
			
			userService.modifyAuthKey(userAuth.getId(), authKey);		
			
			model.addAttribute("email", user.getEmail());
			model.addAttribute("name", user.getName());
			return "user/emailConfirmCheck";			
	}
	
	@RequestMapping(value = "/kakaoKoin", method = RequestMethod.GET)
	public String kakaoJoin() {
		return "user/kakao_join_form";
	}
	
	@RequestMapping(value = "/kakaoJoin", method = RequestMethod.POST)
	public String kakaoJoin(@ModelAttribute User user, Model model, HttpServletRequest request) throws ExistsIdException, ExistsEmailException, ExistsPhoneException, UserNotFoundException, IOException {	
		String kakaoprofile=request.getParameter("profile");
		if (kakaoprofile!=null) {
			URL url = new URL(kakaoprofile);
			String extension = url.toString().substring(url.toString().lastIndexOf(".")+1);
			
			String fileName=kakaoprofile;
			fileName=user.getId()+System.currentTimeMillis();
			
			BufferedImage image = ImageIO.read(url);
			File file = new File(context.getServletContext().getRealPath("/WEB-INF/userProfile")+"/"+fileName+"."+extension);
			System.out.println("file==="+file);
			
			ImageIO.write(image, extension, file);
			
			userService.addUser(user);
			user.setProfile(fileName+"."+extension);	
			
			userService.modifyAuthStatus(user.getId());
			userService.modifyUserProfile(user);
			
		} else {
			userService.addUser(user);
			userService.modifyAuthStatus(user.getId());
		}
		return "user/login_form";
	}
	
	/*-----로그인-----*/
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login_form";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, Model model, HttpSession session) throws LoginAuthFailException, UserNotFoundException {
		User userAuth=userService.getUserById(user.getId());
		userService.getAuth(user);
		
		session.setAttribute("loginUser", userAuth);	
		return "redirect:/";
	}
	
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, Model model, HttpSession session, HttpServletRequest request) throws LoginAuthFailException, UserNotFoundException {
		String kakaoemail=request.getParameter("kakaoemail");
		String kakaoname=request.getParameter("kakaoname");
		String kakaoprofile=request.getParameter("kakaoprofile");
		if (userService.getUserByEmail(kakaoemail)==null) {
			model.addAttribute("kakaoemail", kakaoemail);
			model.addAttribute("kakaoname", kakaoname);
			model.addAttribute("kakaoprofile", kakaoprofile);
			return "user/kakao_join_form";
		} 
		
		User kakaoUserAuth=userService.getUserByEmail(kakaoemail);
		session.setAttribute("loginUser", kakaoUserAuth);
		return "redirect:/";
	}
	
	
	/*-----로그아웃-----*/
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	/*-----인증상태 업데이트-----*/
	@RequestMapping(value="/emailConfirm/{id}/{authKey}", method = RequestMethod.GET)
	public String authStatus(@PathVariable String id, @PathVariable String authKey, User user, Model model) throws UserNotFoundException {
		User userAuth=userService.getUserById(user.getId());
		id=userAuth.getId();
		authKey=userAuth.getAuthKey();
		
		model.addAttribute("name", userAuth.getName());
		userService.modifyAuthStatus(userAuth.getId());
		return "user/emailConfirm";
	}
	
	
	/*-----아이디 찾기-----*/
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "user/findId_form";
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.POST)
	public String findId(String name, String email, User user, HttpServletRequest request) throws FindIdFailException {
		User userAuth=userService.findId(name, email);
		String url=request.getRequestURL().toString().replace("findId", "");
		
		ApplicationContext context=new ClassPathXmlApplicationContext("email.xml");	
		EmailSend bean = context.getBean("emailSend", EmailSend.class);
		bean.sendEmail(userAuth.getEmail(), "Medicines 아이디 찾기", userAuth.getName()+"님 안녕하세요! 회원님의 아이디는 "+userAuth.getId()+"입니다.<br><a href='"+url+"login'>로그인하러가기</a>");
		((ClassPathXmlApplicationContext)context).close();		
		
		return "user/foundId";
	}
	
	@RequestMapping(value = "/foundId", method = RequestMethod.GET)
	public String foundId() {
		return "user/foundId";
	}
	
	
	/*-----비밀번호 찾기-----*/
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "user/findPw_form"; 
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(String id, String email, HttpServletRequest request) throws FindPasswordFailException {
		User userAuth=userService.findPassword(id, email);
		String url=request.getRequestURL().toString().replace("findPw", "");
		String password=new AuthKey().getKey(10, false);
		
		ApplicationContext context=new ClassPathXmlApplicationContext("email.xml");	
		EmailSend bean = context.getBean("emailSend", EmailSend.class);
		bean.sendEmail(userAuth.getEmail(), "Medicines 비밀번호 찾기", userAuth.getName()+"님 안녕하세요! 회원님의 임시 비밀번호는 "+password+"입니다.<br>로그인 후 비밀번호를 반드시 변경해주세요.<br><a href='"+url+"login'>로그인하러가기</a>");
		((ClassPathXmlApplicationContext)context).close();	
		
		password = BCrypt.hashpw(password, BCrypt.gensalt());
		userService.modifyPassword(id, password);
		return "user/foundPassword"; 
	}
	
	@RequestMapping(value = "/foundPassword", method = RequestMethod.GET)
	public String foundPassword() {
		return "user/foundPassword";
	}
	
	/*-----회원 정보 수정-----*/
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String updateUserInfo(@RequestParam String id, Model model, User user, HttpSession session) throws UserNotFoundException {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		model.addAttribute("user", userService.getUserById(id));
		return "user/userInfo";
	}
	
	@RequestMapping(value = "/userInfo", method = RequestMethod.POST)
	public String updateUserInfo(@ModelAttribute User user, HttpSession session, MultipartFile uploadFile) throws UserNotFoundException, IOException {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		String uploadDir=context.getServletContext().getRealPath("/WEB-INF/userProfile");
		String fileName=uploadFile.getOriginalFilename();

		if(uploadFile.isEmpty()) {
			user.setProfile(user.getProfile());
		} else {
			fileName=user.getId()+System.currentTimeMillis();
			File file=new File(uploadDir, fileName);
			uploadFile.transferTo(file);
			user.setProfile(fileName);
		}
		
		userService.modifyUserInfo(user);

		if (loginUser.getId().equals(user.getId())) { 
			session.setAttribute("loginUser", userService.getUserById(user.getId()));
		}
		return "redirect:/userInfo?id="+user.getId();
	}
	
	/*-----회원 탈퇴 처리-----*/
	@RequestMapping(value = "userDeleteAccount/{id}/{password}")
	public String removeUser(@PathVariable String id, @PathVariable String password, HttpSession session) throws DeleteAccountFailException, UserNotFoundException{
		userService.removeUserAccount(id, password);
		session.invalidate();
		return "redirect:/";
	}
	
	
	/*내가 쓴 모든 글 보기(게시글, 공지사항, 댓글)*/
	@RequestMapping(value = "/userActivity")
	public String myActivity(@RequestParam String id, User user, Model model, HttpSession session) throws UserNotFoundException {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		model.addAttribute("myBoard", boardService.getMyBoardList(id));
		model.addAttribute("myQuestion", questionService.getMyQuestionBoardList(id));
		model.addAttribute("myBoardComment", commentService.getMyComment(id));
		model.addAttribute("myQuestionComment", questionCommentService.getMyQuestionComment(id));
		return "user/userActivity";
	}
	
	
	/*내가 쓴 모든 게시물 보기*/
	@RequestMapping(value = "/myBoard")
	public String myBoard(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, @RequestParam String id,  User user, HttpSession session, Model model) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		int totalBoard=boardService.getMyBoardCount(search_option, keyword, id);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		pagerMap.put("id", id); 
		
		model.addAttribute("myBoardList", boardService.getBoardUserMyList(pagerMap));
		model.addAttribute("pager", pager);
		return "user/myBoard";
	}
	
	/*내가 쓴 모든 공지사항 보기*/
	@RequestMapping(value = "/myQuestion")
	public String myQuestion(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "title") String search_option, @RequestParam(defaultValue = "") String keyword, @RequestParam String id,  User user, HttpSession session, Model model) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		int totalBoard=questionService.getMyQuestionBoardCount(search_option, keyword, id);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		pagerMap.put("id", id); 
		
		model.addAttribute("myQuestionBoardList", questionService.getQuestionBoardUserMyList(pagerMap));
		model.addAttribute("pager", pager);
		return "user/myQuestion";
	}
	
	/*내가 쓴 모든 게시물 댓글 보기*/
	@RequestMapping(value = "/myBoardComment")
	public String myBoardComment(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "content") String search_option, @RequestParam(defaultValue = "") String keyword, @RequestParam String id,  User user, HttpSession session, Model model) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		int totalBoard=commentService.getMyCommentCount(search_option, keyword, id);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		 
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("id", id); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("myBoardCommentList", commentService.getMyCommentList(pagerMap));
		model.addAttribute("pager", pager);
		return "user/myBoardComment";
	}
	
	/*내가 쓴 모든 공지사항 댓글 보기*/
	@RequestMapping(value = "/myQuestionComment")
	public String myQuestionComment(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "content") String search_option, @RequestParam(defaultValue = "") String keyword, @RequestParam String id,  User user, HttpSession session, Model model) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (!loginUser.getId().equals(user.getId())) {
			return "redirect:/";
		}
		int totalBoard=questionCommentService.getMyQuestionCommentCount(search_option, keyword, id);
		int pageSize=10; 
		int blockSize=5; 
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize); 
		
		
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("id", id); 
		pagerMap.put("startRow", pager.getStartRow());  
		pagerMap.put("endRow", pager.getEndRow()); 
		
		model.addAttribute("myQuestionCommentList", questionCommentService.getMyQuestionCommentList(pagerMap));
		model.addAttribute("pager", pager);
		return "user/myQuestionComment";
	}
	
	/*-----ExistsUserException(이미 존재하는 아이디) 예외-----*/
	@ExceptionHandler(ExistsIdException.class)
	public String exceptionHander(ExistsIdException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("user", exception.getUser());
		return "user/join_form";
	}
	
	
	/*-----ExistsEmailException(이미 존재하는 이메일) 예외-----*/
	@ExceptionHandler(ExistsEmailException.class)
	public String exceptionHander(ExistsEmailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("user", exception.getUser());
		return "user/join_form";
	}
	
	/*-----ExistsEmailException(이미 존재하는 전화번호) 예외-----*/
	@ExceptionHandler(ExistsPhoneException.class)
	public String exceptionHander(ExistsPhoneException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("user", exception.getUser());
		return "user/join_form";
	}
	
//	/*-----UserNotFoundException(존재하지 않는 회원정보) 예외-----*/
//	@ExceptionHandler(UserNotFoundException.class)
//	public String exceptionHander(UserNotFoundException exception, Model model) {
//		model.addAttribute("message", exception.getMessage());
//		model.addAttribute("user", exception.getUser());
//		return "redirect:/";
//	}
	
	
	/*-----LoginAuthFailException(회원 인증 실패) 예외-----*/
	@ExceptionHandler(LoginAuthFailException.class)
	public String exceptionHander(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("id", exception.getId());
		return "user/login_form";
	}
	
	
	/*-----FindIdFailException(아이디 찾기 실패) 예외-----*/
	@ExceptionHandler(FindIdFailException.class)
	public String exceptionHander(FindIdFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("name", exception.getName());
		model.addAttribute("email", exception.getEmail());
		return "user/findId_form";
	}
	
	
	/*-----FindPasswordFailException(비밀번호 찾기 실패) 예외-----*/
	@ExceptionHandler(FindPasswordFailException.class)
	public String exceptionHander(FindPasswordFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("id", exception.getId());
		model.addAttribute("email", exception.getEmail());
		return "user/findPw_form";
	}
	
	/*-----DeleteAccountFailException(회원 탈퇴 실패) 예외-----*/
	@ExceptionHandler(DeleteAccountFailException.class)
	public String exceptionHander(DeleteAccountFailException exception, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", exception.getMessage());
		return "redirect:/userInfo?id="+exception.getId();
	}
}
