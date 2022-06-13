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
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.modal.Admin;
import com.example.demo.modal.User;
import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.policyadmin;
import com.example.demo.userservice.Userservice;
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
	@Autowired
	private Userservice userser;
	 
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
	public String showAllUsers(HttpServletRequest request,@RequestParam("username") String username) {
		List<policyadmin> policyusers=new ArrayList<>();
		for(policyadmin p:userserv.showusers())
		{
			if(p.getPerm().equals("false"))
			policyusers.add(p);
			System.out.println(p);
		}
		List<fieldofficer> fieldusers=new ArrayList<>();
		for(fieldofficer p:fieldser.showusers())
		{
			if(p.getPerm().equals("false"))
			fieldusers.add(p);
		}
		
		 request.setAttribute("users",policyusers);
		 
		  request.setAttribute("userse",fieldusers );
		  List<User> usrs=new ArrayList<>();
			for(User p:userser.showusers())
			{
				if(p.getPolicyreq().equals("true"))
				usrs.add(p);
				System.out.println(p);
			}
			request.setAttribute("adminname", username);
			 request.setAttribute("mb",usrs);
		  request.setAttribute("mode","pr" );
		return "Admin_dashboard";
		
	}
	@GetMapping("/reports")
	public String showAllUsers5(HttpServletRequest request,@RequestParam("username") String username) {
		
			request.setAttribute("adminname", username);
			List<fieldofficer> fieldusers=new ArrayList<>();
			for(fieldofficer p:fieldser.showusers())
			{
				if(p.getConcern()!=null)
				fieldusers.add(p);
			}
			List<policyadmin> policyusers=new ArrayList<>();
			for(policyadmin p:userserv.showusers())
			{
				if(p.getConcern()!=null)
				policyusers.add(p);
		
			}
			 List<User> usrs=new ArrayList<>();
				for(User p:userser.showusers())
				{
					if(p.getConcern()!=null)
					usrs.add(p);
					
				}
			

			 request.setAttribute("fieldhelps", fieldusers);
			 request.setAttribute("policyhelps", policyusers);
			 request.setAttribute("customerhelps", usrs);
			 
		  request.setAttribute("mode","reports" );
		 
		return "Admin_dashboard";
		
	}
	@GetMapping("/replies")
	public String showAllUsers56(HttpServletRequest request,@RequestParam("username") String username,@RequestParam("adminname") String adminname,@RequestParam("category") String category) {
		
		
		
			request.setAttribute("username", username);
		request.setAttribute("category", category);
			request.setAttribute("adminname", adminname);
			
		request.setAttribute("mode","replies" );
		  
		 
		return "Admin_dashboard";
		
	}
	@GetMapping("/repling")
	public String showAllUsers569(HttpServletRequest request,@RequestParam("username") String username,@RequestParam("adminname") String adminname,@RequestParam("category") String category,@RequestParam("reply") String reply) {
		System.out.println(username+category+reply);
		if(category.equals("FieldOfficer"))
		{
			fieldofficer fe=fieldser.findByUsername(username);
			fe.setReply(reply);
			fieldser.saveuser(fe);
		}
		else if(category.equals("PolicyAdmin"))
		{
			policyadmin pe=userserv.findByUsername(username);
			pe.setReply(reply);
			userserv.saveuser(pe);
		}
		else if(category.equals("customer"))
		{
			User use=userser.findByUsername(username);
			use.setReply(reply);
			userser.saveuser(use);
		}
			
		 
		return "redirect:/reports?username="+adminname+"";
		
	}
	
	@GetMapping("/policyrequests")
	public String showAllUsers2(HttpServletRequest request,@RequestParam("username") String username ) {
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getPolicyreq().equals("true"))
			usrs.add(p);
			System.out.println(p);
		}
		
//		User usp=usrs.get(0);
//		User use=new User("abc","abc","abc","abc","abc","abc","abc","abc","abc","false","false");
//		System.out.println(use);
		request.setAttribute("adminname", username);
		 request.setAttribute("mb",usrs);
		
		 request.setAttribute("mode","pre" );
		
		  return "Admin_dashboard";
		
		
	}
	@RequestMapping("/ad_to_fo")
	public String showAllUsers23(HttpServletRequest request,@RequestParam int id,@RequestParam("username") String username) {
		userser.ad_to_fo(id);
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getPolicyreq().equals("true"))
			usrs.add(p);
			System.out.println(p);
		}
		
//		User usp=usrs.get(0);
//		User use=new User("abc","abc","abc","abc","abc","abc","abc","abc","abc","false","false");
//		System.out.println(use);
		request.setAttribute("adminname", username);
		 request.setAttribute("mb",usrs);
		
		 request.setAttribute("mode","pre" );
		
		  return "Admin_dashboard";
		
		
	}
	@RequestMapping("/ad_to_pol")
	public String showAllUsers237(HttpServletRequest request,@RequestParam int id,@RequestParam("username") String username) {
		userser.ad_to_po(id);
	
		  return "redirect:/fo_to_adac?username="+username+"";
		
		
	}
	@RequestMapping("/po_to_adac")
	public String showAllUsers234(HttpServletRequest request,@RequestParam("username") String username) {
		
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getPo_to_adac().equals("true"))
			usrs.add(p);
			System.out.println(p);
		}
		
//		User usp=usrs.get(0);
//		User use=new User("abc","abc","abc","abc","abc","abc","abc","abc","abc","false","false");
//		System.out.println(use);
		 request.setAttribute("mber",usrs);
		request.setAttribute("adminname",username);
		 request.setAttribute("mode","ap" );
		
		  return "Admin_dashboard";
		
		
	}
	@RequestMapping("/fo_to_adac")
	public String showAllUsers23456(HttpServletRequest request,@RequestParam("username") String username) {
		
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getFo_to_adac().equals("true"))
			usrs.add(p);
			System.out.println(p);
		}
		
//		User usp=usrs.get(0);
//		User use=new User("abc","abc","abc","abc","abc","abc","abc","abc","abc","false","false");
//		System.out.println(use);
		 request.setAttribute("mbe",usrs);
		request.setAttribute("adminname", username);
		 request.setAttribute("mode","vp" );
		
		  return "Admin_dashboard";
		
		
	}
	@RequestMapping("/fo_to_adrej&po_to_adrej")
	public String showAllUsers2345(HttpServletRequest request,@RequestParam("username") String username) {
		
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getFo_to_adrej().equals("true")||p.getPo_to_adrej().equals("true"))
			usrs.add(p);
			System.out.println(p);
		}
		
//		User usp=usrs.get(0);
//		User use=new User("abc","abc","abc","abc","abc","abc","abc","abc","abc","false","false");
//		System.out.println(use);
		request.setAttribute("adminname", username);
		 request.setAttribute("rejs",usrs);
		
		 request.setAttribute("mode","rjp" );
		
		  return "Admin_dashboard";
		
		
	}
	@RequestMapping("/admindelete-user")
	public String showAllUsers1(HttpServletRequest request,@RequestParam int id,@RequestParam String category,@RequestParam("username") String username) {
		System.out.println(category);
		
		if(category.equals("PolicyAdmin"))
			userserv.delete(id);
	    else
	    	fieldser.delete(id);
		request.setAttribute("users",userserv.showusers());
		 
		  request.setAttribute("userse", fieldser.showusers());
		  request.setAttribute("adminname",username);
		  request.setAttribute("mode", "pr");
		
		return "Admin_dashboard";
	  
		
	}
	@RequestMapping("/adminaccept-user")
	public String showAllUsers2(HttpServletRequest request,@RequestParam int id,@RequestParam String category,@RequestParam("username") String username) {
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
		  request.setAttribute("adminname", username);
		 
		request.setAttribute("mode","pr");
		return "Admin_dashboard";
	  
		
	}
	@RequestMapping("/adminstay")
	public String showAllUsers178(HttpServletRequest request,@RequestParam("username") String username) {
		
		  request.setAttribute("adminname",username);
		 
		
		return "Admin_dashboard";
	  
		
	}
	
	@RequestMapping("/adminlogout")
	public String showAllUsers17(HttpServletRequest request,@RequestParam("username") String username) {
		
		  request.setAttribute("adminname",username);
		  request.setAttribute("mode", "logout");
		
		return "Admin_dashboard";
	  
		
	}
	
	 @RequestMapping("/adminforgotpassword1")
	  public String home34(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "forgotpassword");
		  return "welcome_Admin";
	  }
	  @RequestMapping("/adminupdatepassword")
	  public String h356(@ModelAttribute() Admin user,BindingResult bind,HttpServletRequest request,@RequestParam("newpassword") String newpassword,@RequestParam("newpassword2") String newpassword2)
	  {
		  System.out.println(user);
		 Admin us=serv.findByUsernamendPassword(user.getUsername(),user.getPassword());
		  System.out.println(us);
		  if(us!=null) {
			 
			  
			   if(newpassword.equals(newpassword2))
			  {us.setPassword(newpassword);
			  serv.saveuser(us);
				  request.setAttribute("change","Password is changed Succesfully");
				  request.setAttribute("mode","forgotpassword");
				  return "welcome_Admin";
			  }

			   else
			  {
				  request.setAttribute("error"," New passwords should match Correctly");
				  request.setAttribute("mode","forgotpassword");
				  return "welcome_Admin";
			  }
			  
			}
		  else 
		  {
			  request.setAttribute("error","Username or Password are incorrect.");
			  request.setAttribute("mode","forgotpassword");
			  return "welcome_Admin";
		  }
		
		 

		
	  }
	  @RequestMapping("/adminuserprofile")
	  public String home29(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {Admin us=serv.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("adminname", username);
		  request.setAttribute("mode", "userprofile");
		  return "Admin_dashboard";
	  }
	  @RequestMapping("/adminedit")
	  public String home293(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {Admin us=serv.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("adminname", username);
		  request.setAttribute("mode", "edit");
		  return "Admin_dashboard";
	  }
	  @RequestMapping("/adminsavedetails")
	  public String home2934(@ModelAttribute Admin user,HttpServletRequest request,@RequestParam("adminname") String adminname)
	  
	  {
		  Admin us=serv.findByUsername(adminname);
		 
	  us.setUsername(user.getUsername());
	 
	  serv.saveuser(us);
	  
		  return "redirect:/adminuserprofile?username="+us.getUsername()+"";
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
			  
			  Admin vip=serv.findByUsernamendPassword(user.getUsername(), user.getPassword());
			  request.setAttribute("adminname",vip.getUsername());
			  
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
