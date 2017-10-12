package com.huitian.websocket;

import java.net.URI;
import java.util.Properties;

import javax.websocket.ContainerProvider;
import javax.websocket.Session;
import javax.websocket.WebSocketContainer;

import org.springframework.core.io.support.PropertiesLoaderUtils;

import com.huitian.constants.EnumMessageMode;
import com.huitian.constants.EnumMessageType;

/**

 *
 */
public class WebSocketUtils {
	/**
	 *  推送客户端
	 * @param centerAccountId
	 * @param terminalType
	 * @param jsonMessage
	 * @return
	 */
	public static boolean sendMessageToTerminal(String centerAccountId, String terminalType, String jsonMessage) {
		Session session;
		try {
			WebSocketContainer container = ContainerProvider.getWebSocketContainer();
			String chatServerAddress = "";
			String uri = String.format("%s?CENTERACCOUNTID=%s&TERMINALTYPE=%s", chatServerAddress, centerAccountId,
					terminalType);// 连接字符串
			session = container.connectToServer(WebSocketClient.class, new URI(uri)); // 连接会话
			session.getBasicRemote().sendText(jsonMessage); // 发送文本消息，一个json串
			session.close();// 主动关闭连接，以节省资源
			session = null;// 释放资源
			return true;// 发送成功
		} catch (Exception e) {// 发生错误
			e.printStackTrace();
			session = null;// 释放资源
			return false;
		}
	}
}
