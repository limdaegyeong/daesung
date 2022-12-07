package com.danbplus.member.sample.repository;

import java.util.List;
import java.util.Optional;

import com.danbplus.member.sample.controller.MemberController;
import com.danbplus.member.sample.domain.Member;

import lombok.extern.slf4j.Slf4j;

public interface MemberRepository {
	Member save(Member member);
	Optional<Member> findById(String mem_id);
	Optional<Member> findByTel(String mem_tel);
	List<Member> findAll();
	int idCheck(String mem_id);
	int pwCheck(String mem_id, String mem_pw);
	String update(Member member);
	String delete(Member member);
}
