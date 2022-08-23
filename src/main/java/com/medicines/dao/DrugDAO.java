package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.medicines.dto.Drug;

public interface DrugDAO {
	int insertDrug(List<Drug> drug);
	int deleteAllDrug();
	int deleteDrug(String itemSeq);
	int updateDrug(Drug drug);
	int selectDrugCount(@Param("search_option") String search_option, @Param("keyword") String keyword);
	Drug selectDrugByItemSeq(String itemSeq);
	List<Drug> selectAllDrugList(Map<String, Object> map);
}
