package com.huitian.web.image.controller;

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
	}
}
