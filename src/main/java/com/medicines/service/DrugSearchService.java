package com.medicines.service;

import java.util.List;

import com.medicines.dto.DrugSearch;

public interface DrugSearchService {
	void addDrugSearchList(List<DrugSearch> drugSearch);
	void removeAllDrugSearch();
	List<DrugSearch> getAllDrugSearchList(String keyword);
}
