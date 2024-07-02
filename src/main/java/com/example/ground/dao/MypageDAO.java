package com.example.ground.dao;

import com.example.ground.dto.MemberDTO;
import com.example.ground.dto.Member_originDTO;

public interface MypageDAO {
	public void update(Member_originDTO dto);

	public boolean delete(String userid);

	public MemberDTO detail(String userid);

}
