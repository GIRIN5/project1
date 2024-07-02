package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.SocialApplicationDTO;
import com.example.ground.dto.SocialDTO;

public interface SocialDAO {
	void insertmatch(SocialDTO dto);
	int count();
	List<SocialDTO> matchList(int pageStart, int pageEnd);
	SocialDTO detail(int idx);
	void delete(int idx);
	SocialDTO selectone(int idx);
	void insert(int idx,String userid);
	int count2(int idx, String userid);
	List<SocialApplicationDTO> list(int idx);
}
