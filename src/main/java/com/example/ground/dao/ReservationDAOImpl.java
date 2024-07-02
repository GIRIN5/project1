package com.example.ground.dao;

import com.example.ground.dto.ReservationDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Autowired
	private SqlSession sqlSession;

	public void insert(ReservationDTO dto) {
		sqlSession.insert("reservation.insert", dto);
	}

	@Override
	public List<ReservationDTO> check(String groundname) {

		return sqlSession.selectList("reservation.check", groundname);
	}

	@Override
	public List<ReservationDTO> list(String userid) {
		return sqlSession.selectList("reservation.list", userid);
	}

	@Override
	public ReservationDTO detail(int idx) {
		return sqlSession.selectOne("reservation.detail",idx);
	}

}
