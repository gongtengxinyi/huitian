package com.huitian.context.core;

import java.util.LinkedHashSet;
import java.util.concurrent.ConcurrentHashMap;

/**
 * ThreadLocal监听器.
 * 
 * @author lihong
 */
public class ThreadLocalListener {

    private final Object obj = new Object();
    
    /*
     * 因为多线程环境下，使用Hashmap进行put操作会引起死循环，导致CPU利用率接近100%，所以在并发情况下不能使用HashMap。
     * 因此要使用ConcurrentHashMap，即并发哈希映射
     * 键值对分别为ThreadLocal、Object两个对象
     */
    private ConcurrentHashMap<ThreadLocal<?>, Object> statics = new ConcurrentHashMap<ThreadLocal<?>, Object>();
    /*
     * LinkedHashSet：有序的哈希集合
     * LinkedHashSet集合同样是根据元素的hashCode值来决定元素的存储位置，但是它同时使用链表维护元素的次序。
     * 这样使得元素看起 来像是以插入顺序保存的，也就是说，当遍历该集合时候，LinkedHashSet将会以元素的添加顺序访问集合的元素。
     * 
     * HashSet：哈希集合。将哈希对象加入到这个集合。实际上是用哈希的键进行管理的
     * LinkedHashSet是有顺序的HashSet
     * 
     * tmps是内部的私有临时对象，将ThreadLocal存入这个集合
     */
    private ThreadLocal<LinkedHashSet<ThreadLocal<?>>> tmps = new ThreadLocal<LinkedHashSet<ThreadLocal<?>>>();

    /**
     * 
     * @param autoCreate
     * @return 返回一个有序哈希集LinkedHashSet
     */
    private LinkedHashSet<ThreadLocal<?>> forTmps(boolean autoCreate) {
        LinkedHashSet<ThreadLocal<?>> ts = tmps.get();
        if (ts == null && autoCreate) {
            ts = new LinkedHashSet<ThreadLocal<?>>();
            ts.add(tmps);
            tmps.set(ts);
        }
        return ts;
    }

    /**
     * 清除全部的ThreadLocal信息.
     * 必须在dispatcher控制器的finaly中调用该函数,以清除.
     */
    public void clearContexts() {
        for (ThreadLocal<?> tl : statics.keySet().toArray(new ThreadLocal[0])) {
            tl.remove();
        }
        LinkedHashSet<ThreadLocal<?>> tmps = forTmps(false);
        if (tmps != null) {
            for (ThreadLocal<?> tl : tmps.toArray(new ThreadLocal[0])) {
                tl.remove();
            }
        }
    }

    /**
     * 注册一个全局的ThreadLocal(绑定在一个类的static属性下).
     * 
     * @param <E> 要注册的ThreadLocal对象
     * @param tl ThreadLocal对象
     * @return 返回刚才注册登记的ThreadLocal对象.
     */
    public <E> ThreadLocal<E> registStatic(ThreadLocal<E> tl) {
        statics.putIfAbsent(tl, obj);
        return tl;
    }

    /**
     * 注销一个全局的ThreadLocal.
     * 
     * @param <E> 要注销的ThreadLocal对象
     * @param tl ThreadLocal对象
     * @return 返回要注销的ThreadLocal对象
     */
    public <E> ThreadLocal<E> unregistStatic(ThreadLocal<E> tl) {
        statics.remove(tl);
        return tl;
    }

    /**
     * 注册一个请求级别的的threadLocal.
     * 
     * @param <E> 注册的ThreadLocal对象
     * @param tl ThreadLocal对象
     * @return 返回刚才注册登记的ThreadLocal对象.
     */
    public <E> ThreadLocal<E> regist(ThreadLocal<E> tl) {
        forTmps(true).add(tl);
        return tl;
    }

    /**
     * 注销一个请求级别的threadLocal,如果未曾注册,则什么都不做.
     * 
     * @param <E> 要注销的ThreadLocal对象
     * @param tl ThreadLocal对象
     * @return 返回要注销的ThreadLocal对象(无论操作是否真实起效了).
     */
    public <E> ThreadLocal<E> unregist(ThreadLocal<E> tl) {
        LinkedHashSet<ThreadLocal<?>> tmps = forTmps(false);
        if (tmps != null) {
            tmps.remove(tl);
        }
        return tl;
    }
}