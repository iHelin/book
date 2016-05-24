package com.ihelin.book.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.common.io.ByteStreams;

@Controller
public class ImgUploadController{

	private String msg; // 返回信息

	@RequestMapping(value = "imgupload.do", method = RequestMethod.POST)
	@ResponseBody
	public String imgUpload(HttpServletRequest request, HttpServletResponse response) {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		ServletContext application = request.getSession().getServletContext();
		String saveRealFilePath = application.getRealPath("/images/bookdetail/");
		File fileDir = new File(saveRealFilePath);// 文件存放在webapp/attached目录
		if (!fileDir.exists()) { // 如果不存在 则创建
			fileDir.mkdirs();
		}
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Iterator<String> item = multipartRequest.getFileNames();
		while (item.hasNext()) {
			String fileName = (String) item.next();
			MultipartFile file = multipartRequest.getFile(fileName);

			// 检查扩展名
			String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
					.toLowerCase();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = sdf.format(new Date()) + "_" + new Random().nextInt(10000) + "." + fileExt;
			try {
				File uploadedFile = new File(saveRealFilePath, newFileName);
				ByteStreams.copy(file.getInputStream(), new FileOutputStream(uploadedFile));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				String file_Name = request.getContextPath() + "/images/bookdetail/" + newFileName;
				msg = "{\"success\":\"" + true + "\",\"file_path\":\"" + file_Name + "\"}";
				out.print(msg); // 返回msg信息
			}
		}
		return null;
	}
	
}
