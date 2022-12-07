package com.danbplus.member.sample.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.danbplus.member.sample.domain.Member;
import com.danbplus.member.sample.service.MemberService;


import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/")
	private String main() {
		return "main";
	}
	@RequestMapping("/list")
	private String list() {
		return "/members/memberList";
	}
	
	//회원가입 form
	@RequestMapping("/members/create.view")
	public ModelAndView createForm(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("members/createMemberForm");
		return mv;
	}
	
	//회원가입
	//파라미터를 객체에 맵핑시킬때 선언해준다.
	//객체로 받지않는경우에는 HttpServletRequest 객체에서 추출하여 사용한다.
	@ResponseBody
	@RequestMapping("/members/createMember.act")
	public String createMember(Member member , Model model) {
		log.info("###ModelAndView createMember model : " + model);
		log.info("###ModelAndView createMember : " + member.toString());
		memberService.join(member);
		return member.getMem_id()+"";
	}
	
	//회원List 가져오기
	@RequestMapping("/members/memberList.view")
	public ModelAndView memberList(Member member , Model model) {
		List<Member> members = memberService.findMembers();
		//ModelAndView mv = new ModelAndView("members/memberList");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("members/memberList");
		log.info("###ModelAndView memberList : " + members);
		//model.addAttribute("members" , members);
		mv.addObject("members",members);
		log.info("###memberList mv : " + mv);
		return mv;
	}
	
	//회원List 가져오기(회원정보 수정하기 위한 form)
	@RequestMapping("/members/memberUpt.view")
	public ModelAndView memberUptForm(Member member , Model model) {
		List<Member> members = memberService.findMembers();
		//ModelAndView mv = new ModelAndView("members/memberList");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("members/memberUpt");
		log.info("###ModelAndView memberList : " + members);
		//model.addAttribute("members" , members);
		mv.addObject("members",members);
		log.info("###memberList mv : " + mv);
		return mv;
	}
	
	//회원List 가져오기(회원정보 수정하기 위한 form)
	@RequestMapping("/members/memberDelete.view")
	public ModelAndView memberDelForm(Member member , Model model) {
		List<Member> members = memberService.findMembers();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("members/memberDel");
		mv.addObject("members",members);
		return mv;
	}
	
	
	//id 중복체크
	@ResponseBody
	@RequestMapping(value="/members/idCheck", method = RequestMethod.POST)
	public int idCheck(String mem_id) throws Exception{
		log.info("###mem_id : "+mem_id);
		int result = memberService.idCheck(mem_id);
		log.info("result : "+result);
		return result;
	}
	
	//수정,삭제 List에서 선택한 회원의 정보만 가져온다.
	@ResponseBody
	@RequestMapping(value="/members/editMemForm", method = RequestMethod.POST)
	public Optional<Member> editMemInfoForm(String mem_id) {
		Optional<Member> member2 = memberService.findOne(mem_id);
		log.info("!!member2 : "+member2);
		return member2;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/members/pwCheck", method = RequestMethod.POST)
	public int pwCheck(String mem_id, String mem_pw){
		log.info("mem_id : "+mem_id+"mem_pw : "+mem_pw);
		int member3 = memberService.pwCheck(mem_id, mem_pw);
		log.info("###member3 : " + member3);
		return member3;
	}
	
	//회원정보 수정
	@ResponseBody
	@RequestMapping("/members/editMemInfo")
	public String update(Member member, Model model) {
		log.info("###update member 1 : "+member);
		memberService.update(member);
		return member.getMem_id()+"";
	}
	
	//회원정보 삭제
	@ResponseBody
	@RequestMapping("/members/deleteMem")		
	public String delete(Member member, Model model) {
		log.info("###delete : "+ member);
		memberService.delete(member);
		return member.getMem_id()+"";
	}
	
	

}
