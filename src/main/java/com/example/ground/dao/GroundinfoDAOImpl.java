package com.example.ground.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.GroundInfoDTO;

@Repository
public class GroundinfoDAOImpl implements GroundinfoDAO {
	@Autowired
	SqlSession session;

	@Override
	public GroundInfoDTO detail(int idx) {
		
		return session.selectOne("groundinfo.detail",idx);
	}

}
