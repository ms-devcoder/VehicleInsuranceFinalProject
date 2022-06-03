package com.example.demo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.policyadmin;
import com.example.demo.userservice.fieldservice;


@Controller
public class fieldcontroller {
	@Autowired
	  private fieldservice userser;
	 
	  @RequestMapping("/fieldofficerregister")
	  public String home2(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_fieldofficerregister");
		  return "welcome_fieldofficer";
	  }
	  @PostMapping("/fieldofficersave-user")
	  public String home3(@ModelAttribute fieldofficer user,BindingResult bind,HttpServletRequest request)
	 
	  {// policyadmin use =new policyadmin("sai123","pha","mohan","siddana","22-02-22","male","9553256","40@gmail.com","juniot","indic");
	  
		  userser.saveuser(user);
	 
		  request.setAttribute("mode", "mode_fieldofficerregistered");
		  return "welcome_fieldofficer";
	  }

	  @RequestMapping("/fieldofficerlogin")
	  public String home3(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_fieldofficerlogin");
		  
		  return "welcome_fieldofficer";
	  }
	  @RequestMapping("/fieldofficerloginuser")
	  public String h3(@ModelAttribute() fieldofficer user,BindingResult bind,HttpServletRequest request)
	  {
		  fieldofficer vip=userser.findByUsernamendPassword(user.getUsername(), user.getPassword());
		  if(vip!=null&&!vip.getPerm().equals("false")) {
			  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
			  
				return "fieldOfficer_dashboard";
			}
		  else
		  {
			  
			  request.setAttribute("error", "Invalid,Username Or Password");
			  request.setAttribute("mode", "mode_fieldofficerlogin");
//			  System.out.println(user);
//			  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
//			  request.setAttribute("mode", "mode_home");
			  return "welcome_fieldofficer";
		  }
		
	  }
}
