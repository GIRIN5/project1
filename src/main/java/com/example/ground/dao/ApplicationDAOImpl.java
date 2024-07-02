package com.example.ground.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.ApplicationDTO;

@Repository
public class ApplicationDAOImpl implements ApplicationDAO {
	@Autowired
	SqlSession session;

	@Override
	public void insert(ApplicationDTO dto) {
		session.insert("application.insert", dto);

	}

	@Override
	public ApplicationDTO check(ApplicationDTO dto) {
		return session.selectOne("application.check", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("application.delete", num);

	}

	@Override
	public List<ApplicationDTO> confirm(String code) {
		return session.selectList("application.confirm", code);
	}

	@Override
	public void deleteappli(ApplicationDTO dto) {
		session.delete("application.deleteapp",dto);
	}

}
