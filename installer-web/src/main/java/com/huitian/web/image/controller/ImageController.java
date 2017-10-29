package com.huitian.web.image.controller;

<<<<<<< HEAD
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("imageController")
@RequestMapping("image")
public class ImageController {
	@RequestMapping("addImage")
	public String addImage() {
		return "image/imageadd";
	}

	@RequestMapping("imageList")
	public String imageList() {
		return "image/imageList";
=======
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.huitian.api.image.service.ImageService;
import com.huitian.api.image.service.ImageTypeService;
import com.huitian.po.image.Image;
import com.huitian.po.image.ImageType;

@Controller("webImageController")
@RequestMapping("image")
public class ImageController {
	
	@Autowired
	private ImageService imageService;
	@Autowired
	private ImageTypeService imageTypeService;
	
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
>>>>>>> branch 'master' of https://github.com/gongtengxinyi/huitian.git
	}
}
