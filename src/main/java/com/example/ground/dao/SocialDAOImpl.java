package com.example.ground.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.SocialApplicationDTO;
import com.example.ground.dto.SocialDTO;

@Repository
public class SocialDAOImpl implements SocialDAO {
	@Autowired
	SqlSession session;

	@Override
	public void insertmatch(SocialDTO dto) {
		session.insert("social.insertmatch", dto);
	}

	@Override
	public List<SocialDTO> matchList(int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageStart);
		map.put("end", pageEnd);
		return session.selectList("social.matchList",map);
	}

	@Override
	public int count() {
		
		return session.selectOne("social.count");
	}

	@Override
	public SocialDTO detail(int idx) {
		
		return session.selectOne("social.detail",idx);
	}

	@Override
	public void delete(int idx) {
		session.delete("social.delete",idx);
		
	}

	@Override
	public SocialDTO selectone(int idx) {
	
		return session.selectOne("social.selectone",idx);
	}

	@Override
	public void insert(int idx,String userid) {
	
		Map<String,Object> map =new HashMap<>();
		map.put("idx", idx);
		map.put("userid",userid);
	 session.insert("social.insert",map);
	}

	@Override
	public int count2(int idx, String userid) {
		Map<String,Object> map =new HashMap<>();
		map.put("idx", idx);
		map.put("userid",userid);
		return session.selectOne("social.check",map);
	}

	@Override
	public List<SocialApplicationDTO> list(int idx) {
		
		return session.selectList("social.list",idx);
	}

}
