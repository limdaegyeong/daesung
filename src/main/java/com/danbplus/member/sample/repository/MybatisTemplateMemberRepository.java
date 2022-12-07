package com.danbplus.member.sample.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danbplus.member.sample.domain.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository //여기서 어노테이션을 쓰던지 config를 만들어서 주입시키던지 해야한다.
public class MybatisTemplateMemberRepository implements MemberRepository {
	
	private SqlSession sqlSession;

	
	public MybatisTemplateMemberRepository(SqlSession sqlsession) {
		this.sqlSession = sqlsession;
	}
	
	@Override
	public Member save(Member member) {
		log.info("####PSH Mybatis연동 확인 Save");
		this.sqlSession.insert("MemberSource.save" , member);
		return member;
	}

	@Override
	public Optional<Member> findById(String mem_id) {
		// TODO Auto-generated method stub
		HashMap findByIdParamMap = new HashMap<>();
		findByIdParamMap.put("mem_id", mem_id);
		Member member = this.sqlSession.selectOne("MemberSource.findById", findByIdParamMap);
		return Optional.ofNullable(member);
	}

	@Override
	public Optional<Member> findByTel(String mem_tel) {
		HashMap findByTelParamMap = new HashMap<>();
		findByTelParamMap.put("mem_tel", mem_tel);
		Member member = new Member();
		member = this.sqlSession.selectOne("MemberSource.findByTel", findByTelParamMap);
		return Optional.ofNullable(member);
	}

	@Override
	public List<Member> findAll() {
		List<Member> resultList = this.sqlSession.selectList("MemberSource.findAll");
		return resultList;
	}

	@Override
    public int idCheck(String mem_id){
		int result = this.sqlSession.selectOne("MemberSource.idCheck", mem_id);
        return result;

    }

	@Override
	public int pwCheck(String mem_id, String mem_pw) {
		HashMap findByTelParamMap = new HashMap<>();
		findByTelParamMap.put("mem_id", mem_id);
		findByTelParamMap.put("mem_pw", mem_pw);
		log.info("Mybatis pwCheck : "+mem_id+"   "+mem_pw);
		int result = this.sqlSession.selectOne("MemberSource.pwCheck",findByTelParamMap);
		log.info("Mybatis result : "+result);
		return result;
	}

	@Override
	public String update(Member member) {
		log.info("template member : "+ member);
		this.sqlSession.update("MemberSource.updateMem", member);
		return member.getMem_id();
	}

	@Override
	public String delete(Member member) {
		this.sqlSession.delete("MemberSource.deleteMem", member);
		return member.getMem_id();
	}







}
