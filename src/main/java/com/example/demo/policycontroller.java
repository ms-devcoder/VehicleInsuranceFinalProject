package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.modal.policyadmin;
import com.example.demo.userservice.Userservice;
import com.example.demo.userservice.policyadminservice;
@Controller
public class policycontroller {

	@Autowired
	  private policyadminservice userser;
	 
	  @RequestMapping("/policyadminregister")
	  public String home2(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_policyadminregister");
		  return "welcome_PolicyAdmin";
	  }
	  @PostMapping("/policyadminsave-user")
	  public String home3(@ModelAttribute policyadmin user,BindingResult bind,HttpServletRequest request)
	 
	  {// policyadmin use =new policyadmin("sai123","pha","mohan","siddana","22-02-22","male","9553256","40@gmail.com","juniot","indic");
	  
		  userser.saveuser(user);
	 
		  request.setAttribute("mode", "mode_policyadminregistered");
		  return "welcome_PolicyAdmin";
	  }

	  @RequestMapping("/policyadminlogin")
	  public String home3(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_policyadminlogin");
		  
		  return "welcome_PolicyAdmin";
	  }
	  @RequestMapping("/policyadminloginuser")
	  public String h3(@ModelAttribute() policyadmin user,BindingResult bind,HttpServletRequest request)
	  {
		  if(userser.findByUsernamendPassword(user.getUsername(), user.getPassword())!=null) {
			  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
				return "home";
			}
		  else
		  {
			  
			  request.setAttribute("error", "Invalid,Username Or Password");
			  request.setAttribute("mode", "mode_policyadminlogin");
//			  System.out.println(user);
//			  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
//			  request.setAttribute("mode", "mode_home");
			  return "welcome_PolicyAdmin";
		  }
		
	  }
}
