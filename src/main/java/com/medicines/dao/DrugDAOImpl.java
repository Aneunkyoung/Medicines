package com.medicines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.Drug;
import com.medicines.mapper.DrugMapper;

@Repository
public class DrugDAOImpl implements DrugDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertDrug(List<Drug> drug) {
		return sqlSession.getMapper(DrugMapper.class).insertDrug(drug);
	}

	@Override
	public int deleteAllDrug() {
		return sqlSession.getMapper(DrugMapper.class).deleteAllDrug();
	}

	@Override
	public int selectDrugCount(String search_option, String keyword) {
		return sqlSession.getMapper(DrugMapper.class).selectDrugCount(search_option, keyword);
	}
	
	@Override
	public Drug selectDrugByItemSeq(String itemSeq) {
		return sqlSession.getMapper(DrugMapper.class).selectDrugByItemSeq(itemSeq);
	}

	@Override
	public List<Drug> selectAllDrugList(Map<String, Object> map) {
		return sqlSession.getMapper(DrugMapper.class).selectAllDrugList(map);
	}

	@Override
	public int deleteDrug(String itemSeq) {
		return sqlSession.getMapper(DrugMapper.class).deleteDrug(itemSeq);
	}

	@Override
	public int updateDrug(Drug drug) {
		return sqlSession.getMapper(DrugMapper.class).updateDrug(drug);
	}
}
