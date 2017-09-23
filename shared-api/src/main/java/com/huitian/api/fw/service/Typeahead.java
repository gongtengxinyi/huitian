package com.huitian.api.fw.service;

import java.util.List;

import com.huitian.util.Dto;

/**
 * 在文本框输入字符，在数据库中检索符合条件的数据，并显示在下拉列表中，以便选择
 * @author ZlyjB
 *
 * @param <T>
 */
public interface Typeahead<T> {
    
    int LIMIT = 10;
    
    String TAG_Q = "q";
    
    List<T> doTypeahead(Dto params);
}
