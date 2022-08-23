package com.medicines.dao;

import java.util.List;

import com.medicines.dto.DrugSearch;

public interface DrugSearchDAO {
	int insertDrugSearchList(List<DrugSearch> drugSearch);
	int deleteAllDrugSearch();
	List<DrugSearch> selectAllDrugSearchList(String keyword);
}
