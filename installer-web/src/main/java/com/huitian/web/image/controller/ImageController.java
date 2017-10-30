package com.huitian.web.image.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String addImag() {
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
	public HashMap<String,Object> saveImage(@RequestParam("data")String data,HttpServletRequest request) {
		Image image = JacksonHelper.toObject(data, Image.class);	
HashMap<String,Object> map =new HashMap<String,Object>();
		try {
			imageService.save(image);	
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("success", false);
		}	
		return map;
	}
	
	
	@RequestMapping("addImageType")
	public String addImageType() {
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
