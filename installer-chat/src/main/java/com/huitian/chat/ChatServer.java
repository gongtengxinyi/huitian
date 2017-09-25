package com.huitian.chat;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.huitian.constants.EnumMessageMode;
import com.huitian.po.indent.Indent;

import sun.misc.BASE64Decoder;

/***
 * 绘天加工任务调度模块，根据用户选择的加工中心进行推送，如果加工征信正在工作，则放入非阻塞对列中FIFO,先进先出。
 * 
 * @author 丁建磊订单
 *
 */
@Component
@ServerEndpoint("/chatServer")
public class ChatServer {
	private static Log logger = LogFactory.getLog(ChatServer.class);
	private static long MAX_BIG_LONG = 1024 * 4 * 1024;
	/** 加工设备对应 chatServer */
	private static ConcurrentHashMap<String, ChatServer> centerAccountIdToChatServer = new ConcurrentHashMap<String, ChatServer>();
	/** 排队。 queue.isEmpty() offer poll */
	private static ConcurrentHashMap<String, ConcurrentLinkedQueue<Indent>> centerAccountIdToQueue = new ConcurrentHashMap<String, ConcurrentLinkedQueue<Indent>>();
	/** token验证 **/
	private String token;
	private String terminalType;// 连接过来的类型，可能是接口或者是pc终端
	/** 与某个客户端的连接会话，需要通过它来给客户端发送数据 */
	private Session session;
	// 设备id
	private String centerAccountId;

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;

	}

	@OnOpen
	public void onOpen(Session session) {
		session.setMaxTextMessageBufferSize((int) MAX_BIG_LONG);
		this.session = session;
		if (!parseQueryString(session)) // 如果未能取得用户id和type，退出
			return;
		try {
			checkCenterAccount();// 检查是否是系统的账号
			addChatUserToHashMap(centerAccountId, this);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private boolean addChatUserToHashMap(String centerAccountId, ChatServer chatServer) {
		try {
			ConcurrentLinkedQueue<Indent> queue = null;
			centerAccountIdToChatServer.put(centerAccountId, chatServer);
			if (centerAccountIdToQueue.containsKey(centerAccountId)) {
				queue = centerAccountIdToQueue.get(centerAccountId);
			} else {
				queue = new ConcurrentLinkedQueue<Indent>();
			}
			centerAccountIdToQueue.put(centerAccountId, queue);
			return true;
		} catch (Exception e) {
			logger.error("添加账号出错");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 检查是否是系统账号
	 */
	private void checkCenterAccount() {
		// TODO Auto-generated method stub

	}

	/**
	 * 从哈希中移除已经断开的连接
	 * 
	 * @param chatUserId
	 * @param terminalUuid
	 * @return
	 */
	private boolean removeChatUserFromRoomHashMap(String centerAccountId) {
		try {
			ChatServer chatServer = centerAccountIdToChatServer.get(centerAccountId);
			// 释放资源，清空chatServer
			chatServer = null;
			centerAccountIdToChatServer.remove(centerAccountId);// 将chatServer的实例从哈希中移除。
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 解析查询字符串，取得用户id，type，uuid，indentid 失败则关闭连接
	 * 
	 * @param session
	 * @return 成功返回true，失败返回false
	 */
	private boolean parseQueryString(Session session) {
		// 以下取得queryString，并从中解析到用户id和类型
		String queryString = session.getQueryString();// 取得查询字符串
		if (StringUtils.isBlank(queryString)) {// 如果没有传递参数，则关闭此连接
			closeSession(session);// 关闭会话
			return false;
		}
		String chatUserIdStart = "CHATUSERID="; // 查询字符串的每一节，以&隔开，传递用户id的部分以userID开头，必须有
		String roomIdStart = "ROOMID="; // 用户类型的开头字符串，必须有
		try {
			String[] queryStringArray = queryString.split("&");// 查询字符串用&连接
			if (queryStringArray.length == 0) // 如果没有查询字符串，则返回false，调用者会据此关闭连接
				return false;
			for (int i = 0; i < queryStringArray.length; i++) {// ‘对查询字符串进行检查，如果有uid等参数，则取出病赋值
				if (queryStringArray[i].toUpperCase().startsWith(chatUserIdStart)) {// 用户id
					// this.setChatUserId(queryStringArray[i].split("=")[1]);
				}
				if (queryStringArray[i].toUpperCase().startsWith(roomIdStart)) {// 类型
					// this.setRoomId(queryStringArray[i].split("=")[1]);
				}
			}
		} catch (Exception e) {// 解析查询字符串发生错误--传递的查询字符串错误
			closeSession(session);// 关闭连接
			return false;
		}
		return true;
	}

	/**
	 * 关闭websocket连接。
	 * 
	 * @param session
	 *            要关闭的会话
	 */
	private void closeSession(Session session) {
		try {
			session.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose(Session session) {
		try {
			removeChatUserFromRoomHashMap(this.centerAccountId);
		} catch (Exception e) {

		}
	}

	/**
	 * 收到客户端消息后调用的方法。 客户端发送消息的方法是，发送到服务器，消息中指明要传送给那个用户，消息的类型。<br/>
	 * 此处只管发送，至于发送的模式（紧急通知，普通通知，订单消息，聊天信息），这里并进行解析处理，由客户端自行处理。<br/>
	 * 
	 * 
	 * @param message
	 *            客户端发送过来的消息
	 * @param session
	 *            可选的参数
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		if (StringUtils.isBlank(message)) // 收到的是空串
			return;
		Gson gson = null;
		try {// 解析json串
			gson = new Gson();
			ChatMessage chatMessage = gson.fromJson(message, ChatMessage.class);
			// 解析json出错
			if (chatMessage == null)
				return;
			parseChatMessage(chatMessage);
			/**
			 * 目的为了以后对每个模块进行拓展，所以分开写
			 * 
			 */
			// 如果是图片类型的消息体
			// if (StringUtils.equals(chatMessage.getMessageType(),
			// EnumMessageType.IMAGE.name())) {
			// try {
			// boolean dealImageResult = dealBinary(chatMessage);// 处理图片结果
			// if (!dealImageResult) {
			// return;// 如果没生成，则返回
			// }
			// } catch (Exception e) {
			// logger.error("处理图片异常" + e.getMessage());
			// }
			// }
			// 处理小视频
			// else if ((StringUtils.equals(chatMessage.getMessageType(),
			// EnumMessageType.VIDEO.name()))) {
			// try {
			// boolean dealVideoResult = dealBinary(chatMessage);
			// if (!dealVideoResult) {
			// return;
			// }
			// } catch (Exception e) {
			// logger.error("处理小视频异常" + e.getMessage());
			// }
			//
			// }
			// 处理二进制文件
			// else if ((StringUtils.equals(chatMessage.getMessageType(),
			// EnumMessageType.BINARY.name()))) {
			// try {
			// boolean dealBinaryResult = dealBinary(chatMessage);
			// if (!dealBinaryResult) {
			// return;
			// }
			// } catch (Exception e) {
			// // TODO: handle exception
			// logger.error("处理文件异常" + e.getMessage());
			// }
			// }
			// chatMessage.setImageBase64("");// 清空串
			// // 不用做NPE判断，因为chatUser如果为空 则推出closeSession 所以不可能为空
			// chatMessage.setChatName(this.chatUser.getUsername());
			// sendMessageToEveryoneInRoom(chatMessage);
		} catch (Exception e) {// 发生错误即退出
			e.printStackTrace();
		}
	}

	/**
	 * 包含各种消息，启动机器开始获取订单
	 * 
	 * @param chatMessage
	 */
	private void parseChatMessage(ChatMessage chatMessage) {
		Gson gson = new Gson();
		if (StringUtils.equals(chatMessage.getMessageMode(), EnumMessageMode.APP_PUSH_INDENT.name())) {

			try {
				String centerAccountId = "";
				Indent indent = null;
				ConcurrentLinkedQueue<Indent> indentQueue = centerAccountIdToQueue.get(centerAccountId);
				indentQueue.offer(indent);
				centerAccountIdToQueue.put(centerAccountId, indentQueue);// 更新队列
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (StringUtils.equals(chatMessage.getMessageMode(), EnumMessageMode.START_MACHINE.name())) {
			try {
				String centerAccountId = "";
				ConcurrentLinkedQueue<Indent> indentQueue = centerAccountIdToQueue.get(centerAccountId);
				Indent indent = indentQueue.poll();
				String message = gson.toJson(indent);
				ChatServer chatServer = centerAccountIdToChatServer.get(centerAccountId);
				chatServer.sendMessage(message);
				centerAccountIdToQueue.put(centerAccountId, indentQueue);// 更新队列
			} catch (Exception e) {
			}
		} else if (StringUtils.equals(chatMessage.getMessageMode(), EnumMessageMode.STOP_MACHINE.name())) {

		} else if (StringUtils.equals(chatMessage.getMessageMode(), EnumMessageMode.WECHAT_PUSH_INDENT.name())) {

		}
	}

	// 构造文件路径字符串 格式为年月日 比如 2006/200608/20060801
	private String datePart() {
		Calendar c = Calendar.getInstance();
		/********************** 年度目录2006 **********************************/
		StringBuilder part = new StringBuilder().append(c.get(Calendar.YEAR)); // 当前年度
		part.append("/");

		/**********************
		 * 年度月份目录 200608
		 **********************************/
		part.append(c.get(Calendar.YEAR));
		int month = c.get(Calendar.MONTH) + 1;
		if (month < 10) {
			part.append("0");
		}
		part.append(month);
		part.append("/");
		/**********************
		 * 年度月份日期目录 20060801
		 **********************************/
		part.append(c.get(Calendar.YEAR));
		if (month < 10) {
			part.append("0");
		}
		part.append(month);
		int day = c.get(Calendar.DATE);

		if (day < 10) {
			part.append("0");
		}
		part.append(day);

		return part.toString();
	}

	/**
	 * 解析base64字符串的函数，将其转换成音频
	 * 
	 * @param chatMessage
	 * @return boolean
	 */
	// private boolean dealBinary(ChatMessage chatMessage) {
	// try {
	// String uploadBasepath = StartUpListenerSpring.uploadBasepath;
	// String downloadBasepath = StartUpListenerSpring.downloadBasepath;//
	// String fileName = UuidUtil.get32UUID();// 文件名字
	// String imgDatePart = datePart();
	// StringBuilder sb = new StringBuilder();
	// sb.append(uploadBasepath).append("/").append(imgDatePart).append("/");
	// File dateFile = new File(sb.toString());
	// StringBuilder binaryUrl = new StringBuilder();
	// if (!dateFile.exists()) {
	// try {
	// dateFile.mkdirs();
	// } catch (Exception e) {
	// logger.error("创建文件夹失败" + e);
	// }
	// }
	// String imgStr = chatMessage.getImageBase64();// 获取文件的base64串
	// if (StringUtils.isNotBlank(imgStr)) {
	// String imgStrTemp = "";
	// String[] str = imgStr.split(",");
	// imgStrTemp = str[1];// base串分割，要不生成不了完整文件
	// binaryUrl.append(downloadBasepath).append("/").append(imgDatePart).append("/").append(fileName)
	// .append(".").append(chatMessage.getSuffix());
	// int result = generateImage(imgStrTemp,
	// sb.append(fileName).append(".").append(chatMessage.getSuffix()).toString());
	// // 根据base64生成wenjian
	// sb=null;//将资源释放
	// if (result == 1) {
	// chatMessage.setBinaryAddress(binaryUrl.toString());// 设置回填url
	// } else {
	// logger.info("生成二进制文件失败");// 此时文件有问题
	// chatMessage.setBinaryAddress(binaryUrl.toString());// 设置回填url
	// }
	// } else {
	// logger.info("二进制文件base64串为空");
	// }
	// } catch (Exception e) {
	// logger.error("base64 字符串 解析 二进制错误" + e);
	// e.printStackTrace();
	// return false;
	// }
	// return true;
	// }

	/**
	 * 将图片base64字符串转换成 图片
	 * 
	 * @param imgStr
	 * @param path
	 * @return
	 * @throws IOException
	 */
	public static int generateImage(String imgStr, String path) throws IOException {
		if (imgStr == null) // 图像数据为空
		{
			// logger.error("文件数据为空");
			return 0;
		}

		BASE64Decoder d = new BASE64Decoder();
		byte[] bs = null;
		try {
			bs = d.decodeBuffer(imgStr);
		} catch (IOException e1) {
			// logger.error(e1);
			return 0;

		}
		FileOutputStream os;
		try {
			os = new FileOutputStream(path);
			os.write(bs);
			os.close();
		} catch (FileNotFoundException e) {
			// logger.error(e);
			return 0;
			// TODO Auto-generated catch block

		}
		return 1;
	}
	/**
	 * 向指定用户发送消息
	 * 
	 * @param message
	 * @return
	 * @throws IOException
	 */
	public boolean sendMessage(String message) {

		try {
			if (!this.session.isOpen()) {
				logger.error("seesion closed");
				return false;
			}
			synchronized (session) {
				this.session.getBasicRemote().sendText(message);
			}
			return true;
		} catch (Exception e) {
			logger.error("捕获错误");
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 发生错误时调用
	 * 
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		try {
			closeSession(session);
			removeChatUserFromRoomHashMap(this.centerAccountId);
		} catch (Exception e) {
		}
	}
}