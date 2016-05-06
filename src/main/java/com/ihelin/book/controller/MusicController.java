package com.ihelin.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MusicController {

	@RequestMapping(value = "music")
	public String handleMusic(){
		return "music";
	}
}
