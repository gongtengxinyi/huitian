package com.huitian.web.indent.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huitian.po.indent.Wordblank;

@Controller("webWordblankController")
public class WordblankController  {

	@RequestMapping(value = "AssociatedinformationGet")
	@ResponseBody
	public String AssociatedinformationGet(HttpServletRequest request) {
		return "login";
	}
	@RequestMapping(value = "wordblankList")
	@ResponseBody
	public List<Wordblank> getAllWordblankList(HttpServletRequest request) {
		//return "login";
		return null;
	}
}
