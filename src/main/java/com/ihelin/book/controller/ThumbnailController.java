package com.ihelin.book.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.coobird.thumbnailator.Thumbnails;

/**
 * 图片添加缩略图
 * 
 * @author ihelin
 */
@Controller
public class ThumbnailController {
	
	public static final int WIDTH = 100;
	public static final int HEIGHT = 100;

	@RequestMapping("example")
	public String upload() {
		return "upload";
	}

	@RequestMapping(value = "thumbnail", method = RequestMethod.POST)
	public String thumbnail(@RequestParam("image") CommonsMultipartFile file, HttpSession session, Model model)
			throws Exception {
		String uploadPath = "images";// 相对路径
		String realUploadPath = session.getServletContext().getRealPath(uploadPath);// 真实路径
		String imageUrl = uploadImage(file, uploadPath, realUploadPath);
		String thumbImageUrl = trhumbnail(file, uploadPath, realUploadPath);
		model.addAttribute("imageUrl", imageUrl);
		model.addAttribute("thumbImageUrl", thumbImageUrl);
		return "thumbnail";
	}
	
	public String trhumbnail(CommonsMultipartFile file, String uploadPath, String realUploadPath) {
		try {
			String des = realUploadPath + "/thumb" + file.getOriginalFilename();
			Thumbnails.of(file.getInputStream()).size(WIDTH, HEIGHT).toFile(des);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadPath + "/thumb" + file.getOriginalFilename();
	}
	
	public String uploadImage(CommonsMultipartFile file, String uploadPath, String realUploadPath) {
		InputStream is = null;
		OutputStream os = null;
		try {
			is = file.getInputStream();
			String des = realUploadPath + "/" + file.getOriginalFilename();
			os = new FileOutputStream(des);
			byte[] buffer = new byte[1024];
			@SuppressWarnings("unused")
			int len = 0;
			while ((len = is.read(buffer)) > 0) {
				os.write(buffer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return uploadPath + "/" + file.getOriginalFilename();
	}

}
