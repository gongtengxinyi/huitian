package com.huitian.dto;


/**
 * 文件条目
 * @author ZlyjB
 *
 */
public class FileItem {

    private String fileName;//文件名
    private String filePath;//文件存储路径

    public FileItem(String fileName, String filePath) {
        super();
        this.fileName = fileName;
        this.filePath = filePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}