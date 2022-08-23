package com.medicines.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.medicines.dto.Board;
import com.medicines.dto.Drug;
import com.medicines.dto.DrugSearch;
import com.medicines.dto.User;
import com.medicines.service.DrugSearchService;
import com.medicines.service.DrugService;
import com.medicines.util.Pager;

@Controller
public class DrugController {
	@Autowired
	private DrugService drugService;
	
	@Autowired
	private DrugSearchService drugSearchService;
	
	@RequestMapping(value = "displayDrug", method = RequestMethod.GET)
	public String displayDrug(HttpSession session) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		return "drug/displayDrug";
	}
	
	@RequestMapping(value = "displayDrug", method = RequestMethod.POST)
	public String displayDrug(HttpServletRequest request, Model model, HttpSession session) {
		User loginUser=(User) session.getAttribute("loginUser");
		if (loginUser==null || loginUser.getUserStatus()!=9) {
			return null;
		}
		drugService.removeAllDrug();
		drugSearchService.removeAllDrugSearch();
		
		String[] drugList=request.getParameterValues("drugVal");
		
		List<Drug> drugs=new ArrayList<Drug>();
		List<DrugSearch> drugSearchs=new ArrayList<DrugSearch>();
		
		for (int i = 0; i < drugList.length; i++) {
			String[] temp=drugList[i].split("#");
			Drug drug=new Drug(temp[0], temp[1], temp[2], temp[3], temp[4], temp[5], temp[6], temp[7], temp[8], temp[9], temp[10]);
			drugs.add(drug);
			
			String url=request.getRequestURL().toString().replace("displayDrug", "");
			DrugSearch drugSearch=new DrugSearch(drug.getEntpName(), drug.getItemName(), drug.getItemImage(), url+"drug_view?itemSeq="+drug.getItemSeq());
			drugSearchs.add(drugSearch);
		}
		
		drugService.addDrug(drugs);
		drugSearchService.addDrugSearchList(drugSearchs);
		model.addAttribute("message", "db에 저장 완료되었습니다.");
		return "drug/displayDrug";  
	} 
	
	@RequestMapping(value = "drugInfo", method = RequestMethod.GET) 
	@ResponseBody
	public Map<String, Object> drugInfo() throws IOException {
		StringBuilder sb = new StringBuilder();
		for(int i=1; i<=37;i++) {
		    StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
		    urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=W3eAbpgtngKbSceqhbaElLffCWS1jgZH%2Bz7vn78naAI3iCIZmm4ZT6hv%2FMDC%2BNnNfMMbWO0SW%2FHZGXZBQiqaHg%3D%3D"); /*Service Key*/
		    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
		    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(i), "UTF-8")); /*페이지 번호*/
		    urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) Default:xml*/
		    URL url = new URL(urlBuilder.toString());
		    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		    conn.setRequestMethod("GET");
		    conn.setRequestProperty("Content-type", "application/json");
		    
		    BufferedReader rd;
		    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		    } else {
		        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		    }
		    
		    String line;
		    while ((line = rd.readLine()) != null) {
		        sb.append(line);
		        
		    } 
		    rd.close();
		    conn.disconnect();
		}
		Map<String, Object> result = null;
		result=new ObjectMapper().readValue(sb.toString(), Map.class);
		return result;
	} 
	 
	@RequestMapping(value = "drugs")
	public String drugs(Model model, @RequestParam(defaultValue = "1")int pageNum, @RequestParam(defaultValue = "entpName")String search_option, @RequestParam(defaultValue = "")String keyword) {
		int totalBoard=drugService.getDrugCount(search_option, keyword);
		int pageSize=15; 
		int blockSize=5; 
		Pager pager = new Pager(pageNum, totalBoard, pageSize, blockSize); 
		Map<String, Object> pagerMap=new HashMap<String, Object>(); 
		pagerMap.put("search_option", search_option); 
		pagerMap.put("keyword", keyword); 
		pagerMap.put("startRow", pager.getStartRow()); pagerMap.put("endRow", pager.getEndRow()); 
		model.addAttribute("drugList", drugService.getAllDrugList(pagerMap)); 
		model.addAttribute("pager", pager);

		return "drug/drugs";  
	} 
	 
	@RequestMapping(value = "drug_view")
	public String drug_view(@RequestParam String itemSeq, Model model) {
		model.addAttribute("drug", drugService.getDrugByItemSeq(itemSeq));
		return "drug/drug_view";
	}
	
	@RequestMapping(value = "/drug_modify/{itemSeq}", method = RequestMethod.GET)
	public String updateDrug(@PathVariable String itemSeq, HttpSession session, Model model) {   
		User user = (User) session.getAttribute("loginUser");
		if (!(user.getUserStatus()==9)) {
			return "redirect:/drugs";
		}
		model.addAttribute("drug", drugService.getDrugByItemSeq(itemSeq));
		return "drug/drug_modify"; 
	} 
	@RequestMapping(value = "/drug_modify/{itemSeq}", method = RequestMethod.POST)
	public String updateDrug(@PathVariable String itemSeq, HttpSession session, Drug drug) {   
		User user = (User) session.getAttribute("loginUser");
		if (!(user.getUserStatus()==9)) {
			return "redirect:/drugs";
		}
		drugService.modifyBoard(drug);
		return "redirect:/drug_view?itemSeq="+itemSeq; 
	} 
	
	@RequestMapping(value ="removeDrug/{itemSeq}", method = RequestMethod.GET)
	public String removeDrug(@PathVariable String itemSeq, Drug drug, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		if (!(user.getUserStatus()==9)) {
			return "redirect:/drugs";
		}
		drugService.removeDrug(itemSeq);
		return "redirect:/drugs";
	}
}
