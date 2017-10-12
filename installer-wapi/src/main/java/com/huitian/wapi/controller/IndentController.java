package com.huitian.wapi.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huitian.constants.EnumMessageMode;
import com.huitian.constants.EnumMessageType;
import com.huitian.po.indent.IndentDto;
import com.huitian.util.json.JacksonHelper;
import com.huitian.websocket.MessageUtil;
import com.huitian.websocket.WebSocketUtils;

///订单相关的controller

@Controller("wapiIndentController")
public class IndentController {
	private static Log logger = LogFactory.getLog(IndentController.class);

	@RequestMapping(value = "demo")
	@ResponseBody
	public String AssociatedinformationGet(HttpServletRequest request) {
		return "login";
	}
/**
 * 下单接口
 * @param indentDto
 * @return
 */
	@RequestMapping(value = "order")
	@ResponseBody
	public String order(IndentDto indentDto) {
		if (indentDto != null) {
			String indentjson = JacksonHelper.toJson(indentDto);
			String centerAccountId = indentDto.getCenterAccountId();
			String message =MessageUtil.createStartMessage(centerAccountId, EnumMessageMode.APP_PUSH_INDENT.name(),
					EnumMessageType.TEXT.name(), indentjson);
			try {
				WebSocketUtils.sendMessageToTerminal(centerAccountId, "WAPI", message);	
			} catch (Exception e) {
				// TODO: handle exception
			}			
		}
		return "";
	}

	@RequestMapping(value = "getIndentListForEveryType")
	@ResponseBody
	public String getIndentListForEveryType(
			@RequestParam(required = false, defaultValue = "1", value = "page") int page, // 记录页数
			@RequestParam(required = false, defaultValue = "6", value = "limit") int limit,
			@RequestParam(required = true, defaultValue = "", value = "type") int type) {

		return "login";
	}
}