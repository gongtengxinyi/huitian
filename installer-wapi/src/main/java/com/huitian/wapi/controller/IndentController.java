package com.huitian.wapi.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

///订单相关的controller

@Controller("wapiIndentController")
public class IndentController  {
	private static Log logger = LogFactory.getLog(IndentController.class);
	@RequestMapping(value = "demo")
	@ResponseBody
	public String AssociatedinformationGet(HttpServletRequest request) {
		return "login";
	}
}