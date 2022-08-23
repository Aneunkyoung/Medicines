package com.medicines.mapper;

import java.util.List;

import com.medicines.dto.DrugSearch;

public interface DrugSearchMapper {
	int insertDrugSearchList(List<DrugSearch> drugSearch);
	int deleteAllDrugSearch();
	List<DrugSearch> selectAllDrugSearchList(String keyword);
}
