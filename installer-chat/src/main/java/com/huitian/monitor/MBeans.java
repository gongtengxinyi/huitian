package com.huitian.monitor;

import java.lang.management.ManagementFactory;
import java.util.Set;

import javax.management.JMException;
import javax.management.MBeanServer;
import javax.management.MalformedObjectNameException;
import javax.management.ObjectName;

/**
 * @author djl
 * 2016 5 26  检测tomcat的实体MBeanServer
 */
public class MBeans {

	private final MBeanServer mbeanServer;

	MBeans() {
		this(getPlatformMBeanServer());
	}

	private MBeans(MBeanServer mbeanServer) {
		super();
		this.mbeanServer = mbeanServer;
	}
	/**
	 * 获取MBeanServer
	 * @return
	 */
	static MBeanServer getPlatformMBeanServer() {
		return ManagementFactory.getPlatformMBeanServer();
	}
	/**
	 * 获取tomcat的线程池
	 * @return
	 * @throws MalformedObjectNameException
	 */
	Set<ObjectName> getTomcatThreadPools() throws MalformedObjectNameException {
		return mbeanServer.queryNames(new ObjectName("*:type=ThreadPool,*"), null);
	}

	Set<ObjectName> getTomcatGlobalRequestProcessors() throws MalformedObjectNameException {
		return mbeanServer.queryNames(new ObjectName("*:type=GlobalRequestProcessor,*"), null);
	}

	Object getAttribute(ObjectName name, String attribute) throws JMException {
		return mbeanServer.getAttribute(name, attribute);
	}
	
}
