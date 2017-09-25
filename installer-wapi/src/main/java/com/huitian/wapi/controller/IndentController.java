package com.huitian.wapi.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "getIndentListForEveryType")
	@ResponseBody
	public String getIndentListForEveryType(@RequestParam(required = false, defaultValue = "1", value = "page") int page, // 记录页数
            @RequestParam(required = false, defaultValue = "6", value = "limit") int limit,
            @RequestParam(required = true, defaultValue = "", value = "type") int type) {
		
		
		return "login";
	}
}