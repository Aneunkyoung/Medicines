package com.medicines.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicines.dao.DrugSearchDAO;
import com.medicines.dto.DrugSearch;

@Service
public class DrugSearchServiceImpl implements DrugSearchService{
	@Autowired
	private DrugSearchDAO drugSearchDAO;

	@Override
	public void addDrugSearchList(List<DrugSearch> drugSearch) {
		drugSearchDAO.insertDrugSearchList(drugSearch);
	}

	@Override
	public void removeAllDrugSearch() {
		drugSearchDAO.deleteAllDrugSearch();
	}

	@Override
	public List<DrugSearch> getAllDrugSearchList(String keyword) {
		return drugSearchDAO.selectAllDrugSearchList(keyword);
	}
}
