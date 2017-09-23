package com.huitian.api.fw;

/**
 * 指点条目
 * 
 * @author ZlyjB
 *
 */
public interface DictEntry {

	/**
	 * 字典条目的显示值
	 * 
	 * @return
	 */
	String text();

	/**
	 * 字典条目的code
	 * 
	 * @return
	 */
	String name();
}
