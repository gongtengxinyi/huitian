package com.huitian.websocket;



import javax.websocket.ClientEndpoint;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

@ClientEndpoint
public class WebSocketClient {
	/**
	 *连接成功，调用此处 
	 * @param session
	 */
	@OnOpen
    public void onOpen(Session session) {
		
        System.out.println("Connected to endpoint: " + session.getBasicRemote());
    }

	/**
	 * 收到消息，调用此处函数
	 * @param message
	 */
    @OnMessage
    public void onMessage(String message) {
        System.out.println(message);
    }

    /**
     * 发生错误，调用此处
     * @param t
     */
    @OnError
    public void onError(Throwable t) {
        t.printStackTrace();
    }
}
