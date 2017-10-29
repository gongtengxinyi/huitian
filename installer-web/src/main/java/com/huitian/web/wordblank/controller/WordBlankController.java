package com.huitian.web.wordblank.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huitian.api.indent.service.WordblankService;
import com.huitian.constants.HuitianResult;
import com.huitian.po.indent.Wordblank;
import com.huitian.util.json.JacksonHelper;
/**
 * 毛坯列表的controller
 * @author Administrator
 *
 */
@Controller("wordBlankController")
@RequestMapping("wordBlank")
public class WordBlankController {
	@Autowired
	private WordblankService wordblankService;
	@RequestMapping("addWordBlank")
	public String addWordBlank() {
		return "wordblank/wordblankadd";
	}
	/**
	 * 保存毛坯的controller
	 * @param data
	 * @param request
	 * @return
	 */
	@RequestMapping("saveWordBlank")
	@ResponseBody
	public HashMap<String,Object> saveWordBlank(@RequestParam("data")String data,HttpServletRequest request) {
		Wordblank wordblank = JacksonHelper.toObject(data, Wordblank.class);	
HashMap<String,Object> map =new HashMap<String,Object>();
		try {
			wordblankService.save(wordblank);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("success", false);
		}	
		return map;
	}
	/**
	 * 获取毛坯列表的list
	 * @return
	 */
	@RequestMapping("wordblankList")
	public String wordblankList() {				
		return "wordblank/wordblanklist";
	}
}
