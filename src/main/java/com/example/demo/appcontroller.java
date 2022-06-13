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
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.modal.User;
import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.image;
import com.example.demo.userservice.Userservice;

@Controller
public class appcontroller {
//	customerservice controller
	@Autowired
  private Userservice userser;
  @RequestMapping("/welcome")
  public String home1(HttpServletRequest request)
  
  {
	  request.setAttribute("mode", "mode_home");
	  return "welcome";
  }
  @RequestMapping("/customerregister")
  public String home2(HttpServletRequest request)
  
  {
	  request.setAttribute("mode", "mode_customerregister");
	  return "welcome_customer";
  }
  @RequestMapping("/userprofile")
  public String home29(HttpServletRequest request,@RequestParam("username") String username)
  
  {User us=userser.findByUsername(username);
  request.setAttribute("user", us);
	  request.setAttribute("customername", username);
	  request.setAttribute("mode", "userprofile");
	  return "ct_dashboard";
  }
  @RequestMapping("/edit")
  public String home293(HttpServletRequest request,@RequestParam("username") String username)
  
  {User us=userser.findByUsername(username);
  request.setAttribute("user", us);
	  request.setAttribute("customername", username);
	  request.setAttribute("mode", "edit");
	  return "ct_dashboard";
  }
  @RequestMapping("/savedetails")
  public String home2934(@ModelAttribute User user,HttpServletRequest request,@RequestParam("customername") String customername)
  
  {System.out.println(customername);
	  User us=userser.findByUsername(customername);
	 
  us.setUsername(user.getUsername());
  us.setEmail(user.getEmail());
  us.setMblnumber(user.getMblnumber());
  if(user.getDob()!=null) {
	  us.setDob(user.getDob());}
  us.setFirstname(user.getFirstname());
  us.setLastname(user.getLastname());
  userser.saveuser(us);
  
	  return "redirect:/userprofile?username="+us.getUsername()+"";
  }
  
  @PostMapping("/customersave-user")
  public String home3(@ModelAttribute User user,BindingResult bind,HttpServletRequest request)
  
  {User us=userser.findByUsername(user.getUsername());
  
  User usp=userser.findByEmail(user.getEmail());
	  if(us==null&&usp==null) {
	  userser.saveuser(user);
  System.out.println(user);
	  request.setAttribute("mode", "mode_customerregistered");
	  return "welcome_customer";}
	  else if(us!=null)
	  {
		  request.setAttribute("error","Username Notavailable");
		  request.setAttribute("mode","mode_customerregister");
		  return "welcome_customer";
	  }
	  else if(usp!=null)
	  {
		  request.setAttribute("error","Email Notavailable");
		  request.setAttribute("mode","mode_customerregister");
		  return "welcome_customer";
	  }
	  return "welcome_customer";
  }
  @GetMapping("/newpolicyrequest")
  public String home8(HttpServletRequest request,@RequestParam("username") String username)
  
  {User user=userser.findByUsername(username);
	  String st="";
  if(user.getPo_to_adac().equals("true"))
	  st=st+"Approved";
  else if(user.getPolicyreq().equals("sent")&&user.getPo_to_adrej().equals("true")||user.getFo_to_adrej().equals("true"))
	  st=st+"Rejected";
  else if(user.getPolicyreq().equals("sent")||user.getPolicyreq().equals("true")) {
	  st=st+"Validating..";
	  request.setAttribute("error","wait till current policyrequest is processed");
      }
  else if(user.getPolicyreq().equals("false"))
	  st=st+"Not Applied";
 
	  
  request.setAttribute("policystatus", st);
	  
	  
  request.setAttribute("customername", username);
  request.setAttribute("mode", "applypolicy");
	  return "ct_dashboard";
  }
  @GetMapping("/review")
  public String home8910(HttpServletRequest request,@RequestParam("username") String username)
  
  {User user=userser.findByUsername(username);
	 
  if(user.getPo_to_adac().equals("true"))
	  request.setAttribute("sendreview","send");
	  
 
 List<User> reviewers=new ArrayList<>();
 
		for(User p: userser.showusers())
		{if(p.getReview()!=null)
			reviewers.add(p);
		}
	  
 
request.setAttribute("reviewers", reviewers);
	  
  request.setAttribute("customername", username);
  request.setAttribute("mode", "review");
	  return "ct_dashboard";
  }
  @PostMapping("/submitreview")
  public String assignments109(HttpServletRequest request,@RequestParam("username") String username,@RequestParam("review") String review)
  {System.out.println(review);
	       User us=userser.findByUsername(username);
	       us.setReview(review);
	       userser.saveuser(us);
	       System.out.println(us);
			  request.setAttribute("customername", username);
			 
			  return "redirect:/review?username="+username+"";
	  
  }

  @GetMapping("/customerhelp")
  public String assignments10(HttpServletRequest request,@RequestParam("username") String username)
  {
	       User us=userser.findByUsername(username);
	       System.out.println(us);
			  request.setAttribute("customername", username);
			  request.setAttribute("concern",us.getConcern());
			  request.setAttribute("reply", us.getReply());
			 
			 
			  request.setAttribute("mode", "help");
			  return "ct_dashboard";
	  
  }
  @GetMapping("/raiseticketct_to_ad")
  public String assignments101(HttpServletRequest request,@RequestParam("username") String username)
  {
	       
			  request.setAttribute("customername", username);
			  
			 
			 
			 
			  request.setAttribute("mode", "raiseticket");
			  return "ct_dashboard";
	  
  }
  @GetMapping("/ctlogout")
  public String assignments1012(HttpServletRequest request,@RequestParam("username") String username)
  {
	       
			  request.setAttribute("customername", username);
			  
			 
			 
			 
			  request.setAttribute("mode", "logout");
			  return "ct_dashboard";
	  
  }
  @RequestMapping("/customerstay")
	public String showAllUsers178(HttpServletRequest request,@RequestParam("username") String username) {
		
		  request.setAttribute("customername",username);
		 
		
		return "ct_dashboard";
	  
		
	}
  @RequestMapping("/ticketfromct_to_ad")
  public String home39(HttpServletRequest request,@RequestParam("concern") String concern,@RequestParam("username") String username)
 

  {
	  System.out.println(username);
	  User us=userser.findByUsername(username);
	  us.setConcern(concern);
	  us.setReply("");
	  userser.saveuser(us);
 
	  
	  return "redirect:/customerhelp?username="+username+"";
  }
  @RequestMapping("/renewalreq")
	public String uploadfilet(HttpServletRequest request,@RequestParam("username") String username)
	{
		
		
			 
			 User us=userser.findByUsername(username);
			 System.out.println(us);
			 us.setAd_to_fo("false");
			 us.setAd_to_po("false");
			 us.setFo_to_adac("false");
			 us.setFo_to_adrej("false");
			 us.setPo_to_adac("false");
			 us.setPo_to_adrej("false");
			 us.setPolicyreq("false");
			 us.setPolicyaccept("false");
			 userser.policyreqsaveuser(us);
		
		return "redirect:/newpolicyrequest?username="+username+"";
	}
  @GetMapping("/renewpolicyrequest")
  public String home89(HttpServletRequest request,@RequestParam("username") String username)
  
  {User user=userser.findByUsername(username);
  System.out.println(user.getPo_to_adac());
  if(user.getPo_to_adac().equals("true"))
  {
	  request.setAttribute("customername", username);
	  request.setAttribute("mode", "renewpolicy");
	  return "ct_dashboard";
  }
  request.setAttribute("customername", username);
  return "ct_dashboard";
 
  }
 

  @RequestMapping("/customerlogin")
  public String home3(HttpServletRequest request)
  
  {
	  request.setAttribute("mode", "mode_customerlogin");
	  return "welcome_customer";
  }
  @RequestMapping("/forgotpassword1")
  public String home34(HttpServletRequest request)
  
  {
	  request.setAttribute("mode", "forgotpassword");
	  return "welcome_customer";
  }
  @RequestMapping("/updatepassword")
  public String h356(@ModelAttribute() User user,BindingResult bind,HttpServletRequest request,@RequestParam("newpassword") String newpassword,@RequestParam("newpassword2") String newpassword2)
  {
	  System.out.println(user);
	  User us=userser.findByUsernameAndMblnumberAndEmail(user.getUsername(),user.getMblnumber(),user.getEmail());
	  System.out.println(us);
	  if(us!=null) {
		 
		  
		   if(newpassword.equals(newpassword2))
		  {us.setPassword(newpassword);
		  userser.saveuser(us);
			  request.setAttribute("change","Password is changed Succesfully");
			  request.setAttribute("mode","forgotpassword");
			  return "welcome_customer";
		  }

		   else
		  {
			  request.setAttribute("error"," New passwords should match Correctly");
			  request.setAttribute("mode","forgotpassword");
			  return "welcome_customer";
		  }
		  
		}
	  else 
	  {
		  request.setAttribute("error","Username or mobilenumber or email are incorrect.");
		  request.setAttribute("mode","forgotpassword");
		  return "welcome_customer";
	  }
	
	 

	
  }
  @RequestMapping("/customerloginuser")
  public String h3(@ModelAttribute() User user,BindingResult bind,HttpServletRequest request)
  {
	  if(userser.findByUsernamendPassword(user.getUsername(), user.getPassword())!=null) {
		  User vip=userser.findByUsernamendPassword(user.getUsername(), user.getPassword());
		  request.setAttribute("customername", vip.getUsername());
			return "ct_dashboard";
		}
	  else
	  {
		  
		  request.setAttribute("error", "Invalid,Username Or Password");
		  request.setAttribute("mode", "mode_customerlogin");
		 
//		  System.out.println(user);
//		  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
//		  request.setAttribute("mode", "mode_home");
		  return "welcome_customer";
	  }
	
  }
//  End of customer service controller
  
  
  
  
  
  
  
  
  
  
@GetMapping("/show-user")
	public String showAllUsers(HttpServletRequest request) {
	  request.setAttribute("users",userser.showusers());
		request.setAttribute("mode", "show-users");
		return "welcome";
	}
//@RequestMapping("/delete-user")
//	public String showAllUsers1(HttpServletRequest request,@RequestParam int id) {
//	  userser.delete(id);
//	  request.setAttribute("users",userser.showusers());
//		request.setAttribute("mode", "show-users");
//		return "welcome";
//	}
//@RequestMapping("/edit-user")
//	public String showAllUsers2(HttpServletRequest request,@RequestParam int id) {
//	  
//	  request.setAttribute("user",userser.update(id));
//		request.setAttribute("mode", "mode_update");
//		return "welcome";
//	}
 
  
	
}
