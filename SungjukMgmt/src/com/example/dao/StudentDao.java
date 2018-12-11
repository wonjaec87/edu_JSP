package com.example.dao;

import java.util.List;
import java.util.Map;

import com.example.vo.StudentVO;

public interface StudentDao {
	void readAll(Map map);
	void create(StudentVO studentVo);
	void read(Map map);
	void delete(String hakbun);
	void update(StudentVO studentVo);
}
