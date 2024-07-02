package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.TeamDTO;
import com.example.ground.dto.TeamMemberDTO;

public interface TeamDAO {
	public void teaminsert(TeamDTO dto);
	public TeamDTO oneteam(String code);
	void delete(String code);
}
