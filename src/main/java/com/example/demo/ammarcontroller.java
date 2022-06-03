package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.modal.Admin;
import com.example.demo.modal.ammar;
import com.example.demo.userservice.ammaservice;

@Controller
public class ammarcontroller {
	@Autowired
	private ammaservice useser;
	@RequestMapping("/welcome1")
	public String regis()
	{
		
		return "ammar";
	}
	
	@RequestMapping("/ammar1")
	public String regis(@ModelAttribute ammar user, BindingResult bind,HttpServletRequest request)
	{
		useser.saveuser(user);
		return "ammar";
	}
	

}
