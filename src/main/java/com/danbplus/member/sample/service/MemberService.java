package com.danbplus.member.sample.service;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.danbplus.member.sample.domain.Member;
import com.danbplus.member.sample.repository.MemberRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service //여기서 어노테이션을 쓰던지 config를 만들어서 주입시키던지 해야한다.
public class MemberService {
	private final MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		
		this.memberRepository = memberRepository;
		
		log.info("###MemberService : {}" , memberRepository);
	}
	
	@Transactional
	public String join(Member member) {
		/*Optional<Member> result = memberRepository.findByName(member.getName());
		result.ifPresent(m -> {
			throw new IllegalStateException("이미 존재하는 회원 입니다.");
		});
		*/
		
		//리팩토링(extract Method -> Alt + shift + m -> 함수명 지정
		//log.info("member : "+member);
		log.info("###MemberService member : {}" , member);
		//validateDuplicateMember(member); //중복확인
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
	 * @param mem_id
	 * @return
	 */
	public Optional<Member> findOne(String mem_id){
		return memberRepository.findById(mem_id);
	}
	
	/**
	 * id 중복체크
	 * @param mem_id
	 * @return
	 */
	public int idCheck(String mem_id){
		
		return memberRepository.idCheck(mem_id);
	
	}
	
	
}
