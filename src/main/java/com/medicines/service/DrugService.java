package com.medicines.service;

import java.util.List;
import java.util.Map;

import com.medicines.dto.Drug;

public interface DrugService {
	void addDrug(List<Drug> drug);
	void removeAllDrug();
	void removeDrug(String itemSeq); 
	void modifyBoard(Drug drug);
	int getDrugCount(String search_option, String keyword);
	Drug getDrugByItemSeq(String itemSeq);
	List<Drug> getAllDrugList(Map<String, Object> map);
}
