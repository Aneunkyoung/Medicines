package com.medicines.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.medicines.dto.DrugSearch;
import com.medicines.mapper.DrugSearchMapper;

@Repository
public class DrugSearchDAOImpl implements DrugSearchDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertDrugSearchList(List<DrugSearch> drugSearch) {
		return sqlSession.getMapper(DrugSearchMapper.class).insertDrugSearchList(drugSearch);
	}

	@Override
	public int deleteAllDrugSearch() {
		return sqlSession.getMapper(DrugSearchMapper.class).deleteAllDrugSearch();
	}

	@Override
	public List<DrugSearch> selectAllDrugSearchList(String keyword) {
		return sqlSession.getMapper(DrugSearchMapper.class).selectAllDrugSearchList(keyword);
	}
}