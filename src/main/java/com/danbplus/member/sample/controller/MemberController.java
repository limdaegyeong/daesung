package com.danbplus.member.sample.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/members/create.view")
	public ModelAndView createForm(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("members/createMemberForm");
		return mv;
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="/members/idCheck", method = RequestMethod.POST)
	public int idCheck(String mem_id) throws Exception{
		log.info("###mem_id : "+mem_id);
		int result = memberService.idCheck(mem_id);
		log.info("result : "+result);
		return result;
	}
	
	
	@RequestMapping("/members/memberCheck")
	public String memberCheck() {
		
		
		
		return "";
	}
	
}
