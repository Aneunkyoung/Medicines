package com.medicines.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(path = "/error")
public class ErrorController {
	@GetMapping
	public String defaultError() {
		return "error/error";
	}

	@GetMapping("/error404")
	public String noResource() {
		return "error/error404";
	}

	@GetMapping("/error500")
	public String serverError() {
		return "error/error500";
	}
}