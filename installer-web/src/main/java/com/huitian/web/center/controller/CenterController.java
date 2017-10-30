package com.huitian.web.center.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huitian.api.machinecenter.service.CenterService;
import com.huitian.po.indent.Wordblank;
import com.huitian.po.machinecenter.Center;
import com.huitian.util.json.JacksonHelper;

@Controller("centerController")
@RequestMapping("center")
public class CenterController {
	@Autowired
	private CenterService centerService;
	@RequestMapping("addcenter")
	public String addCenter() {
		return "center/centeradd";
	}  
	@RequestMapping("saveCenter")
	@ResponseBody
	public HashMap<String,Object> saveWordBlank(@RequestParam("data")String data,HttpServletRequest request) {
		Center Center = JacksonHelper.toObject(data, Center.class);	
HashMap<String,Object> map =new HashMap<String,Object>();
		try {
			centerService.save(Center);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("success", false);
		}	
		return map;
	}
	@RequestMapping("centerList")
	public String centerList() {
		return "center/centerlist";
	}
}
