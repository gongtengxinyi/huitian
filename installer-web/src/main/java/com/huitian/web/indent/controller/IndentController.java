package com.huitian.web.indent.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("webIndentController")
public class IndentController  {

	@RequestMapping(value = "getIndentList")
	public String getIndentList(HttpServletRequest request) {
		return "indent/indentList1";
	}
  
}
