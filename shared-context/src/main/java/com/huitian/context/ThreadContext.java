package com.huitian.context;

import com.huitian.context.core.ThreadLocalHelper;

/**
 * 线程上下文
 * @author ZlyjB
 *
 */
public class ThreadContext {

	/*
	 * 早在JDK 1.2的版本中就提供Java.lang.ThreadLocal，ThreadLocal为解决多线程程序的并发问题提供了一种新的思路。使用这个工具类可以很简洁地编写出优美的多线程程序。
	 * 当使用ThreadLocal维护变量时，ThreadLocal为每个使用该变量的线程提供独立的变量副本，所以每一个线程都可以独立地改变自己的副本，而不会影响其它线程所对应的副本。
	 * 从线程的角度看，目标变量就象是线程的本地变量，这也是类名中“Local”所要表达的意思。
	 * 所以，在Java中编写线程局部变量的代码相对来说要笨拙一些，因此造成线程局部变量没有在Java开发者中得到很好的普及。
	 */
    private static ThreadLocal<ContextBean<String>> tl = ThreadLocalHelper.registStatic(new ThreadLocal<ContextBean<String>>());

    public static ContextBean<String> getContextBean() {
        return tl.get();
    }
    
    public static void setContextBean(ContextBean<String> bean) {
        tl.set(bean);
    }
    
    public static boolean isReady() {
        return getContextBean() != null;
    }
    
    /**
     * 实现ContextBean的getKeyId方法
     * @return
     */
    public static String getKeyId() {
        ContextBean<String> cb = getContextBean();
        return cb == null ? null : cb.getKeyId();
    }
    
    public static void clearContext() {
        tl.remove();
    }
}