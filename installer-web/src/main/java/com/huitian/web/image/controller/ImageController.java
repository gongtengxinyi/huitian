package com.huitian.web.image.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.helper.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.huitian.api.image.service.ImageService;
import com.huitian.api.image.service.ImageTypeService;
import com.huitian.po.image.Image;
import com.huitian.po.image.ImageType;
import com.huitian.util.json.JacksonHelper;

@Controller("webImageController")
@RequestMapping("image")
public class ImageController {
	
	@Autowired
	private ImageService imageService;
	@Autowired
	private ImageTypeService imageTypeService;
	
	
	@RequestMapping("addImage")
	public String addImag(ModelMap map) {
		List<ImageType> imageTypeList = imageTypeService.findAll();
		map.put("imageTypeList", imageTypeList);
		return "image/imageAdd";
	}
	/**
	 * 保存毛坯的controller
	 * @param data
	 * @param request
	 * @return
	 */
	@RequestMapping("saveImage")
	@ResponseBody
	public HashMap<String,Object> saveImage(@RequestParam("data")String data,HttpServletRequest request,
			@RequestParam(value = "imgFiles", required = false) MultipartFile imgFiles) {
		Image image = JacksonHelper.toObject(data, Image.class);	
        HashMap<String,Object> map =new HashMap<String,Object>();
		try {
		    String url=saveFile(imgFiles);
		    image.setImgUrl(url);
			imageService.save(image);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("success", false);
		}	
		return map;
	}
	
	
	public static  String saveFile(MultipartFile imgFiles) {
		// TODO Auto-generated method stub
		Properties properties=null;
		try {
			properties = PropertiesLoaderUtils.loadAllProperties("environment.properties");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}// 从配置文件中读取配置信息
		String uploadBasepath = properties.getProperty("file.upload.basepath");// 图片存放地址
		String downloadBasepath = properties.getProperty("file.download.basepath");// 图片下载地址
		StringBuilder sb2=new StringBuilder();
	
		String imageName=UUID.randomUUID().toString();
		if (!imgFiles.isEmpty()) {  
            try {  
            	String original=imgFiles.getOriginalFilename();
            	String suffix=original.split("\\.")[1];
                // 文件保存路径  
            	StringBuilder sb =new StringBuilder();
                // 转存文件  
                sb.append(uploadBasepath).append("/").append(imageName).append(suffix);
                imgFiles.transferTo(new File(sb.toString()));  
            	sb2.append(downloadBasepath).append("/").append(imageName).append(suffix);
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
		return sb2.toString();
	}
	@RequestMapping("addImageType")
	public String addImageType(ModelMap map) {

		return "image/imageTypeAdd";
	}
	/**
	 * 保存毛坯的controller
	 * @param data
	 * @param request
	 * @return
	 */
	@RequestMapping("saveImageType")
	@ResponseBody
	public HashMap<String,Object> saveWordBlank(@RequestParam("data")String data,HttpServletRequest request) {
		ImageType imageType = JacksonHelper.toObject(data, ImageType.class);	
              HashMap<String,Object> map =new HashMap<String,Object>();
		try {
			imageTypeService.save(imageType);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("success", false);
		}	
		return map;
	}
	
	
	
	
	@RequestMapping(value = "getImageList")
	public String getImageList(HttpServletRequest request,ModelMap map) {
		List<Image> imageList=imageService.findAll();
		map.addAttribute("imageList",imageList);
		return "image/imageList";
	}
	
	
	@RequestMapping(value = "getImageTypeList")
	public String getImageTypeList(HttpServletRequest request,ModelMap map) {
		List<ImageType> imageTypeList=imageTypeService.findAll();
		map.addAttribute("imageTypeList",imageTypeList);
		return "image/imageTypeList";

	}
}
