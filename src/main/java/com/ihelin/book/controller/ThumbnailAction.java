package com.ihelin.book.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class ThumbnailAction {
	@Resource
	private UploadService uploadService;
	@Resource
	private ThumbnailService thumbnailService;

	@RequestMapping("example")
	public String upload() {
		return "upload";
	}

	@RequestMapping(value = "thumbnail", method = RequestMethod.POST)
	public String thumbnail(@RequestParam("image") CommonsMultipartFile file, HttpSession session, Model model)
			throws Exception {
		String uploadPath = "images";// 相对路径
		String realUploadPath = session.getServletContext().getRealPath(uploadPath);// 真实路径
		String imageUrl = uploadService.uploadImage(file, uploadPath, realUploadPath);
		String thumbImageUrl = thumbnailService.trhumbnail(file, uploadPath, realUploadPath);
		model.addAttribute("imageUrl", imageUrl);
		model.addAttribute("thumbImageUrl", thumbImageUrl);
		return "thumbnail";
	}

}
