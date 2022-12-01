package com.danbplus.member.sample.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import com.danbplus.member.sample.domain.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MybatisTemplateMemberRepository implements MemberRepository {
	
	private SqlSession sqlSession;
	
	public MybatisTemplateMemberRepository(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	@Override
	public Member save(Member member) {
		this.sqlSession.insert("MemberSource.save" , member);
		return member;
	}

	@Override
	public Optional<Member> findById(String id) {
		// TODO Auto-generated method stub
		HashMap findByIdParamMap = new HashMap<>();
		findByIdParamMap.put("id", id);
		Member member = this.sqlSession.selectOne("MemberSource.findById", findByIdParamMap);
		return Optional.ofNullable(member);
	}

	@Override
	public Optional<Member> findByTel(String tel) {
		HashMap findByTelParamMap = new HashMap<>();
		findByTelParamMap.put("mem_tel", tel);
		Member member = new Member();
		member = this.sqlSession.selectOne("MemberSource.findByTel", findByTelParamMap);
		return Optional.ofNullable(member);
	}

	@Override
	public List<Member> findAll() {
		List<Member> resultList = this.sqlSession.selectList("MemberSource.findAll");
		return resultList;
	}

}
