package com.example.ground.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.ground.dao.GroundinfoDAO;
import com.example.ground.dao.SocialDAO;
import com.example.ground.dto.GroundInfoDTO;
import com.example.ground.dto.SocialDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import page.PageUtil2;

@Controller
@RequestMapping("/social/*")
public class SocialController {
	@Autowired
	SocialDAO sdao;
	@Autowired
	GroundinfoDAO gdao;

	@PostMapping("create.do")
	public String reserve(HttpSession session, Model model, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");
		String selectedage = request.getParameter("selectedAge");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String groundname = request.getParameter("groundname");
		String gender = request.getParameter("selectedGender");
		String way = request.getParameter("selectedWay");
		int count = Integer.parseInt(request.getParameter("selectedCount"));
		String dateString = request.getParameter("date"); // assuming the date is in "yyyy-MM-dd HH:mm" format
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.sql.Date sqlTimestamp = null;
		try {
			// Convert String to java.util.Date
			Date utilDate = format.parse(dateString);

			// Convert java.util.Date to java.sql.Timestamp
			sqlTimestamp = new java.sql.Date(utilDate.getTime());

			// Now you can use sqlTimestamp for SQL operations
			System.out.println("SQL Timestamp: " + sqlTimestamp);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		SocialDTO sdto = new SocialDTO();
		sdto.setAge(selectedage);
		sdto.setCount(count);
		sdto.setGender(gender);
		sdto.setGroundname(groundname);
		sdto.setIdx(idx);
		sdto.setWay(way);
		sdto.setMatchdate(sqlTimestamp); // Set the timestamp here
		System.out.println(sdto);
		sdao.insertmatch(sdto);
		return "redirect:/mypage/reservedetail.do?idx="+idx;
	}

	@GetMapping("social.do")
	public String socialList(@RequestParam(value = "cur_page", defaultValue = "1") int cur_page, Model model) {
		int count = sdao.count();
		PageUtil2 page = new PageUtil2(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<SocialDTO> dto = sdao.matchList(start, end);
		System.out.println("sssssssssssss" + dto);
		model.addAttribute("dto", dto);
		model.addAttribute("sdao", sdao);

		model.addAttribute("page", page);
		return "social/socialList";
	}

	@GetMapping("detail.do")
	public String socialDetail(@RequestParam(value = "idx") String idx, Model model,HttpSession session) {
		String userid =(String) session.getAttribute("userid");
		int iddx = Integer.parseInt(idx);
		SocialDTO dto = sdao.detail(iddx);
		int sex = dto.getSex(); 
		int count= sdao.count2(iddx, userid);
		
		GroundInfoDTO gdto = gdao.detail(sex);
		System.out.println(gdto);
		model.addAttribute("dto", dto);
		model.addAttribute("count",count);
		model.addAttribute("gdto", gdto);
		return "social/socialDetail";
	}
	@PostMapping("matchstop.do")
	@ResponseBody
	public String matchstop(@RequestParam(value = "idx") String idx) {
		int iddx = Integer.parseInt(idx);
		sdao.delete(iddx);
		return "success";
	}
	@PostMapping("application.do")
	@ResponseBody
	public String application(@RequestParam(value="idx") String idx,@RequestParam(value="userid") String userid){		
		
		int asd=Integer.parseInt(idx);
		sdao.insert(asd, userid);
		return "success";
	}
}
