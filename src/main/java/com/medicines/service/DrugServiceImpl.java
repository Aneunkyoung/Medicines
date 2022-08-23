package com.medicines.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medicines.dao.DrugDAO;
import com.medicines.dto.Drug;

@Service
public class DrugServiceImpl implements DrugService{
	@Autowired
	private DrugDAO drugDAO;

	@Override
	public void addDrug(List<Drug> drug) {
		drugDAO.insertDrug(drug);
	}

	@Override
	public void removeAllDrug() {
		drugDAO.deleteAllDrug();
	}
	
	@Override
	public int getDrugCount(String search_option, String keyword) {
		return drugDAO.selectDrugCount(search_option, keyword);
	}
	
	@Override
	public Drug getDrugByItemSeq(String itemSeq) {
		return drugDAO.selectDrugByItemSeq(itemSeq);
	}

	@Override
	public List<Drug> getAllDrugList(Map<String, Object> map) {
		return drugDAO.selectAllDrugList(map);
	}

	@Override
	public void removeDrug(String itemSeq) {
		drugDAO.deleteDrug(itemSeq);
	}

	@Override
	public void modifyBoard(Drug drug) {
		drugDAO.updateDrug(drug);
	}
}
