package com.huitian.web.indent.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("webIndentController")
public class IndentController  {

	@RequestMapping(value = "demo")
	public String AssociatedinformationGet(HttpServletRequest request) {
		return "indent/indentList1";
	}
  
}
