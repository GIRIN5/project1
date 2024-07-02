package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.ApplicationDTO;

public interface ApplicationDAO {
void insert(ApplicationDTO dto);
ApplicationDTO check(ApplicationDTO dto);
void delete(int num);
List<ApplicationDTO> confirm(String code);
void deleteappli(ApplicationDTO dto);
}
