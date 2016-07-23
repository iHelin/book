package com.ihelin.book.controller;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class ThumbnailService {

	public static final int WIDTH = 100;
	public static final int HEIGHT = 100;

	public String trhumbnail(CommonsMultipartFile file, String uploadPath, String realUploadPath) {
		try {
			String des = realUploadPath + "/thumb" + file.getOriginalFilename();
			Thumbnails.of(file.getInputStream()).size(WIDTH, HEIGHT).toFile(des);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uploadPath + "/thumb" + file.getOriginalFilename();
	}

}
