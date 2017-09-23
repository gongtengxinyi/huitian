package com.huitian.api.fw.service;

import java.util.List;

import com.huitian.dto.SysDict;

/**
 * SysDictService接口
 * @author lihome
 *
 */
public interface SysDictService {
    
    String BEAN_NAME = "sysDictService";
    
    /**
     * Refresh dict
     */
    void refreshDict();

    /**
     * 
     * @param groupCode
     * @param top
     * @param excludeKeys
     * @return
     */
    List<SysDict> listGroupCopy(String groupCode, SysDict top, String... excludeKeys);
    
    /**
     * 
     * @param groupCode
     * @param excludeKeys
     * @return
     */
    List<SysDict> listGroupCopy(String groupCode, String... excludeKeys);
    
    List<SysDict> listGroupTransfer(String groupCode, SysDict top, String... includeKeys);
    
    List<SysDict> listGroupTransfer(String groupCode, String... includeKeys);
    
    String text(String groupCode, String value);
    
    String texts(String groupCode, String... values);
    
    Integer order(String groupCode, String value);
}
