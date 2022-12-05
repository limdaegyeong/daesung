package com.danbplus.member.sample.repository;

import java.util.List;
import java.util.Optional;

import com.danbplus.member.sample.domain.Member;

public interface MemberRepository {
	Member save(Member member);
	Optional<Member> findById(String id);
	Optional<Member> findByTel(String tel);
	List<Member> findAll();
	int idCheck(String mem_id);
}
