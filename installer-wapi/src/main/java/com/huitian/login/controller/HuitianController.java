package com.huitian.login.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huitian.api.account.service.CenterAccountService;
import com.huitian.constants.HttpResponseStatus;
import com.huitian.constants.HuitianResult;
import com.huitian.dto.Filter;
import com.huitian.po.account.CenterAccount;
import com.huitian.util.json.JacksonHelper;

@Controller("loginController")
@RequestMapping("/huitianterminal")
public class HuitianController {
	private static Log logger = LogFactory.getLog(HuitianController.class);
	@Autowired
	private CenterAccountService centerAccountService;
	@RequestMapping("tabGetData")
	@ResponseBody
	public HuitianResult pcterminalLogin(@RequestBody String data) {
	  Filter filter = JacksonHelper.toObject(data, Filter.class);
	  
		
	}
	/**
	 * 修改密码
	 *
	 * @param centerAccountId
	 * @param password
	 * @return
	 */
	@RequestMapping("motifyPassword")
	@ResponseBody
	public HuitianResult motifyPassword(@RequestParam String centerAccountId, @RequestParam String password) {
		HuitianResult huitianResult = new HuitianResult();
		try {
			CenterAccount centerAccount = new CenterAccount();
			centerAccount.setId(centerAccountId);
			centerAccountService.update(centerAccount);
			huitianResult.ok();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			huitianResult.build(HttpResponseStatus.MOTIFYPASSWORD_ERROR, "修改密码错误");
		}
		return huitianResult;
	}

	/**
	 * 为pc端创建账号，开始验证账号
	 *
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public HuitianResult pcterminalLogin(@RequestParam String username, @RequestParam String password) {
		HuitianResult huitianResult = new HuitianResult();

		CenterAccount centerAccount = null;
		try {
			centerAccount = centerAccountService.findOne(Filter.eq("name1", username), Filter.eq("password", password));
			if (centerAccount != null) {
				return huitianResult.build(HttpResponseStatus.SUCCESS, "登录成功！", centerAccount);
			} else {
				return huitianResult.build(HttpResponseStatus.NO_USER, "用户名或者密码错误！", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("find centerAccount username and password error" + e);
			return huitianResult.build(HttpResponseStatus.ERROR, "服务器异常", null);

		}
	}

}
