package com.example.demo;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.modal.Admin;
import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.policyadmin;
import com.example.demo.userservice.adminservice;
import com.example.demo.userservice.fieldservice;
import com.example.demo.userservice.policyadminservice;

@Controller
public class admincontroller {
	@Autowired
	  private policyadminservice userserv;
	@Autowired
	private fieldservice fieldser;
	@Autowired
	private adminservice serv;
	 
//	  @RequestMapping("/policyadminregister")
//	  public String home2(HttpServletRequest request)
//	  
//	  {
//		  request.setAttribute("mode", "mode_policyadminregister");
//		  return "welcome_PolicyAdmin";
//	  }
//	  @PostMapping("/policyadminsave-user")
//	  public String home3(@ModelAttribute policyadmin user,BindingResult bind,HttpServletRequest request)
//	 
//	  {// policyadmin use =new policyadmin("sai123","pha","mohan","siddana","22-02-22","male","9553256","40@gmail.com","juniot","indic");
//	  
//		  userser.saveuser(user);
//	      
//		  request.setAttribute("mode", "mode_policyadminregistered");
//		  return "welcome_PolicyAdmin";
//	  }
	@GetMapping("/registrationrequests")
	public String showAllUsers(HttpServletRequest request) {
		List<policyadmin> policyusers=new ArrayList<>();
		for(policyadmin p:userserv.showusers())
		{
			if(p.getPerm().equals("false"))
			policyusers.add(p);
		}
		List<fieldofficer> fieldusers=new ArrayList<>();
		for(fieldofficer p:fieldser.showusers())
		{
			if(p.getPerm().equals("false"))
			fieldusers.add(p);
		}
		
		 request.setAttribute("users",policyusers);
		 
		  request.setAttribute("userse",fieldusers );
		  request.setAttribute("mode", "mode_registrationsrequests");
		
		return "Admin_dashboard";
	}
	@RequestMapping("/admindelete-user")
	public String showAllUsers1(HttpServletRequest request,@RequestParam int id,@RequestParam String category) {
		System.out.println(category);
		
		if(category.equals("PolicyAdmin"))
			userserv.delete(id);
	    else
	    	fieldser.delete(id);
		request.setAttribute("users",userserv.showusers());
		 
		  request.setAttribute("userse", fieldser.showusers());
		  request.setAttribute("mode", "mode_registrationsrequests");
		
		return "Admin_dashboard";
	  
		
	}
	@RequestMapping("/adminaccept-user")
	public String showAllUsers2(HttpServletRequest request,@RequestParam int id,@RequestParam String category) {
		System.out.println(category);
		
		if(category.equals("PolicyAdmin"))
			userserv.saveaccpteduser(id);
	    else
	    	fieldser.saveaccpteduser(id);
		List<policyadmin> policyusers=new ArrayList<>();
		for(policyadmin p:userserv.showusers())
		{
			if(p.getPerm().equals("false"))
			policyusers.add(p);
		}
		List<fieldofficer> fieldusers=new ArrayList<>();
		for(fieldofficer p:fieldser.showusers())
		{
			if(p.getPerm().equals("false"))
			fieldusers.add(p);
		}
		
		 request.setAttribute("users",policyusers);
		 
		  request.setAttribute("userse",fieldusers );
		  request.setAttribute("mode", "mode_registrationsrequests");
		
		return "Admin_dashboard";
	  
		
	}

	  @RequestMapping("/adminlogin")
	  public String home3(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_adminlogin");
		  
		  return "welcome_Admin";
	  }
	  @RequestMapping("/adminloginuser")
	  public String h3(@ModelAttribute() Admin user,BindingResult bind,HttpServletRequest request)
	  {
		  if(serv.findByUsernamendPassword(user.getUsername(), user.getPassword())!=null) {
			  
			  request.setAttribute("admin", user);
			  
				return "Admin_dashboard";
			}
		  else
		  {
			  
			  request.setAttribute("error", "Invalid,Username Or Password");
			  request.setAttribute("mode", "mode_adminlogin");
//			  System.out.println(user);
//			  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
//			  request.setAttribute("mode", "mode_home");
			  return "welcome_Admin";
		  }
		
	  }
}
