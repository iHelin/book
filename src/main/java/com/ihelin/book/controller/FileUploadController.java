package com.ihelin.book.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.io.ByteStreams;
import com.ihelin.book.db.entity.Account;
import com.ihelin.book.db.entity.Book;

@Controller
public class FileUploadController extends BaseController {

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("myfile") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) {
		// 设置头像保存路径
		ServletContext application = request.getSession().getServletContext();
		String saveRealFilePath = application.getRealPath("/images/accountImg/");
		File fileDir = new File(saveRealFilePath);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		if (!file.isEmpty()) {
			try {
				String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
						.toLowerCase();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				try {
					File uploadedFile = new File(saveRealFilePath, newFileName);
					ByteStreams.copy(file.getInputStream(), new FileOutputStream(uploadedFile));
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					String fileName = request.getContextPath() + "/images/accountImg/" + newFileName;
					Account account = getAdmin();
					account.setImg(fileName);
					accountManager.updateAccount(account);
				}
				return "redirect:" + AdminFtl("admin_edit");
			} catch (Exception e) {
				return "error";
			}
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/uploadBookImg/{bookId}", method = RequestMethod.POST)
	public String handleBookImgUpload(@RequestParam("myfile") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response,@PathVariable("bookId") Integer bookId) {
		// 设置头像保存路径
		ServletContext application = request.getSession().getServletContext();
		String saveRealFilePath = application.getRealPath("/images/bookImg/");
		File fileDir = new File(saveRealFilePath);
		if (!fileDir.exists()) {
			fileDir.mkdirs();
		}
		if (!file.isEmpty()) {
			try {
				String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
						.toLowerCase();
				SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
				String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
				try {
					File uploadedFile = new File(saveRealFilePath, newFileName);
					ByteStreams.copy(file.getInputStream(), new FileOutputStream(uploadedFile));
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					String fileName = request.getContextPath() + "/images/bookImg/" + newFileName;
					Book book = bookManager.selectBookById(bookId);
					book.setImg(fileName);
					bookManager.updateBook(book);
				}
				return "redirect:/" + AdminFtl("books");
			} catch (Exception e) {
				return "error";
			}
		} else {
			return "error";
		}
	}
}
