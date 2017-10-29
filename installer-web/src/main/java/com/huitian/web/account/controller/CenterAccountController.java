package com.huitian.web.account.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huitian.api.account.service.CenterAccountService;
import com.huitian.api.machinecenter.service.CenterService;
import com.huitian.po.account.CenterAccount;
import com.huitian.po.machinecenter.Center;
import com.huitian.util.json.JacksonHelper;

@Controller("accountController")
@RequestMapping("centerAccount")
public class CenterAccountController {
	@Autowired
	private CenterService  centerService;
	@Autowired
	private CenterAccountService centerAccountService;
	@RequestMapping("addCenterAccount")
	public String addCenter(ModelMap map) {
		List<Center> centerList = centerService.findAll();
		map.addAttribute("centerList", centerList);
		return "account/centerAccountadd";
	}
	@RequestMapping("saveCenterAccount")
	@ResponseBody
	public HashMap<String,Object> saveWordBlank(@RequestParam("data")String data,HttpServletRequest request) {
		CenterAccount CenterAccount = JacksonHelper.toObject(data, CenterAccount.class);	
HashMap<String,Object> map =new HashMap<String,Object>();
		try {
			centerAccountService.save(CenterAccount);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("success", false);
		}	
		return map;
	}
//	@RequestMapping("accountList")
//	public String accountList() {
//		return "account/accountlist";
//	}
}
