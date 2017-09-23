package com.huitian.context;

/**
 * 接口，上下文，只有一个方法getKeyId
 * @author ZlyjB
 *
 * @param <T>
 */
public interface ContextBean<T> {

    T getKeyId();
}
