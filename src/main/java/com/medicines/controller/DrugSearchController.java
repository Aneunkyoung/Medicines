package com.medicines.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.medicines.service.DrugSearchService;
import com.medicines.dto.DrugSearch;

@Controller
public class DrugSearchController {
	@Autowired 
	private DrugSearchService drugSearchService;
	
	@RequestMapping(value = "drugSearch")
	@ResponseBody
	public List<DrugSearch> DrugSearch(String keyword) {
		List<DrugSearch> drugSearchList = null;
		drugSearchList=drugSearchService.getAllDrugSearchList(keyword);
		return drugSearchList;
	}
} 
