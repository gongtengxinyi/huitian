package com.huitian.websocket;

import com.huitian.chat.ChatMessage;
import com.huitian.constants.EnumMessageMode;
import com.huitian.constants.EnumMessageType;
import com.huitian.util.json.JacksonHelper;

public class MessageUtil {
	/**
	 * 
	 * @return
	 */
	public static String createStartMessage(String centerAccountId, String messageMode, String messageType,
			String indentDtoJson) {
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setIndentDto(indentDtoJson);
		chatMessage.setMessage(centerAccountId);
		chatMessage.setMessageMode(messageMode);
		chatMessage.setMessageType(messageType);
		return JacksonHelper.toJson(chatMessage);
	}
}
