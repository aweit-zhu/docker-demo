package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

	@GetMapping("/")
	public String get() {
		System.out.println("This is a DockerDemo! /");
		return "This is a DockerDemo1!";
	}
	
	@GetMapping("/test")
	public String getTest() {
		System.out.println("This is a DockerDemo! /test");
		return "This is a DockerDemo2!";
	}
}
