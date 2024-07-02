package com.example.ground.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.ground.dao.GroundDAO;
import com.example.ground.dao.MypageDAO;
import com.example.ground.dao.ReservationDAO;
import com.example.ground.dao.SocialDAO;
import com.example.ground.dao.TeamDAO;
import com.example.ground.dao.TeamMemberDAO;
import com.example.ground.dto.GroundDTO;
import com.example.ground.dto.MemberDTO;
import com.example.ground.dto.ReservationDTO;
import com.example.ground.dto.SocialApplicationDTO;
import com.example.ground.dto.SocialDTO;
import com.example.ground.dto.TeamMemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	MypageDAO mypageDao;
	@Autowired
	TeamMemberDAO tdao;
	@Autowired
	TeamDAO dao;
	@Autowired
	ReservationDAO rdao;
	@Autowired
	GroundDAO gdao;
	@Autowired
	SocialDAO sdao;

	/*
	 * @GetMapping("detail.do") public ModelAndView detail(HttpSession session,
	 * ModelAndView mav, Model model) { String userid = (String)
	 * session.getAttribute("userid"); List<TeamMemberDTO> teamlist =
	 * tdao.listTeam(userid); List<String> codeList = new ArrayList<>(); for
	 * (TeamMemberDTO item : teamlist) { codeList.add(item.getCode()); }
	 * List<TeamDTO> team = dao.listTeam(codeList); System.out.println("team" +
	 * team);
	 * 
	 * try { MemberDTO dto = mypageDao.detail(userid);
	 * mav.setViewName("mypage/mypage"); mav.addObject("dto", dto); } catch
	 * (Exception e) { mav.setViewName("member_origin/login"); }
	 * mav.addObject("team", team); return mav; }
	 */
	@GetMapping("detail.do")
	public ModelAndView detail(HttpSession session, ModelAndView mav, Model model) {
		String userid = (String) session.getAttribute("userid");
		List<TeamMemberDTO> team = tdao.listTeam(userid);
		List<ReservationDTO> reserve = rdao.list(userid);
		try {
			MemberDTO dto = mypageDao.detail(userid);
			mav.setViewName("mypage/mypage");
			mav.addObject("dto", dto);
		} catch (Exception e) {
			mav.setViewName("member_origin/login");
		}
		mav.addObject("reserve", reserve);
		mav.addObject("team", team);
		return mav;
	}

	/*
	 * @GetMapping("reservationlist.do") public String reserve(HttpSession session,
	 * Model model) { String userid = (String) session.getAttribute("userid");
	 * List<ReservationDTO> reserve = rdao.list(userid);
	 * model.addAttribute("reserve", reserve); System.out.println(reserve); return
	 * "mypage/reservelist"; }
	 */
	@GetMapping("reservedetail.do")
	public String reserve(HttpSession session, Model model, HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		SocialDTO sdto=sdao.selectone(idx);
		List<SocialApplicationDTO> list=sdao.list(idx);
		ReservationDTO rdto = rdao.detail(idx);
		String groundname = rdto.getGroundname();
		GroundDTO gdto = gdao.detail_list(groundname);
		System.out.println(sdto);
		System.out.println(gdto);
		System.out.println(rdto);
		model.addAttribute("list",list);
		model.addAttribute("sdto",sdto);
		model.addAttribute("gdto", gdto);
		model.addAttribute("rdto", rdto);
		return "mypage/reservedetail";
	}
}
