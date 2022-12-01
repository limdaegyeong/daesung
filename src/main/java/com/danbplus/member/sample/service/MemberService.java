package com.danbplus.member.sample.service;

import java.util.List;
import java.util.Optional;

import org.springframework.transaction.annotation.Transactional;

import com.danbplus.member.sample.domain.Member;
import com.danbplus.member.sample.repository.MemberRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberService {
	private final MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		log.info("###MemberService");
		this.memberRepository = memberRepository;
	}
	
	@Transactional
	public String join(Member member) {
		/*Optional<Member> result = memberRepository.findByName(member.getName());
		result.ifPresent(m -> {
			throw new IllegalStateException("이미 존재하는 회원 입니다.");
		});
		*/
		
		//리팩토링(extract Method -> Alt + shift + m -> 함수명 지정
		log.info("member : "+member);
		validateDuplicateMember(member); //중복확인
		memberRepository.save(member);
		return member.getMem_id();
	}

	private void validateDuplicateMember(Member member) {
		log.debug("###PSH validateDuplicateMember");
		memberRepository.findByTel(member.getMem_tel())
			.ifPresent(m -> {
				throw new IllegalStateException("이미 존재하는 회원 입니다.");
			});
	}
	
	/**
	 * 전체 멤버 조회
	 * @return
	 */
	public List<Member> findMembers(){
		return memberRepository.findAll();
	}
	
	/**
	 * 회원조회
	 * @param memberID
	 * @return
	 */
	public Optional<Member> findOne(String memberID){
		return memberRepository.findById(memberID);
	}
}
