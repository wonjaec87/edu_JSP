package com.example.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.example.vo.StudentVO;

public class StudentDaoImpl implements StudentDao {
	private SqlSession sqlSession; 
	
	public StudentDaoImpl() {
		this.sqlSession = SqlSessionFactoryBean.getInstance();
	}

	@Override
	public void readAll(Map map) {
		this.sqlSession.selectList("selectAllSP", map);
	}

	@Override
	public void create(StudentVO studentVo) {
		this.sqlSession.insert("insertSP", studentVo);
	}

	@Override
	public void read(Map map) {
		this.sqlSession.selectOne("selectOneSP", map);
	}

	@Override
	public void delete(String hakbun) {
		this.sqlSession.delete("deleteSP", hakbun);
	}

	@Override
	public void update(StudentVO studentVo) {
		this.sqlSession.update("updateSP", studentVo);
	}

}
