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

import com.example.demo.modal.User;
import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.policyadmin;
import com.example.demo.userservice.Userservice;
import com.example.demo.userservice.fieldservice;
import com.example.demo.userservice.policyadminservice;
@Controller
public class policycontroller {

	@Autowired
	  private policyadminservice userser;
	@Autowired
	private fieldservice fieldser;
	@Autowired
	private Userservice userservice;
	 
	  @RequestMapping("/policyadminregister")
	  public String home2(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_policyadminregister");
		  
		  return "welcome_PolicyAdmin";
	  }
	  @GetMapping("/ad_to_po")
	  public String assignments(HttpServletRequest request,@RequestParam("username") String username)
	  {
		  List<User> users=new ArrayList<>();
				  for(User user:userservice.showusers())
				  {if(user.getAd_to_po().equals("true")&&user.getPo_to_adac().equals("false")&&user.getPo_to_adrej().equals("false"))
				  {
					  users.add(user);
				  }
				 
					  
				  }
				  request.setAttribute("policyadminname", username);
				  request.setAttribute("adpo", users);
				  request.setAttribute("mode", "ad_to_po");
				  return "PolicyAdmin_dashboard";
		  
	  }
	  @GetMapping("/policyadminhelp")
	  public String assignments1(HttpServletRequest request,@RequestParam("username") String username)
	  {
		  policyadmin us=userser.findByUsername(username);
				  request.setAttribute("policyadminname", username);
				  request.setAttribute("concern",us.getConcern());
				  request.setAttribute("reply", us.getReply());
				 
				  
				  request.setAttribute("mode", "help");
				  return "PolicyAdmin_dashboard";
		  
	  }
	  @GetMapping("/raiseticketpo_to_ad")
	  public String assignments102(HttpServletRequest request,@RequestParam("username") String username)
	  {
		       
				  request.setAttribute("policyadminname", username);
				  
				 
				 
				 
				  request.setAttribute("mode", "raiseticket");
				  return "PolicyAdmin_dashboard";
		  
	  }
	  @RequestMapping("/ticketfrompo_to_ad")
	  public String home39(HttpServletRequest request,@RequestParam("concern") String concern,@RequestParam("username") String username)
	 

	  {
		  System.out.println(username);
		 policyadmin us=userser.findByUsername(username);
		  us.setConcern(concern);
		  us.setReply("");
		  userser.saveuser(us);
	 
		  
		  return "redirect:/policyadminhelp?username="+username+"";
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
	  @GetMapping("/poassignmodel")
	  public String assignmentsmodel(HttpServletRequest request,@RequestParam String username,@RequestParam("policyadminname") String policyadminname)
	  {
		  
				 
					  User user=userservice.findByUsername(username);
					 
				              request.setAttribute("condition", "accepted");
					 
					  request.setAttribute("policyadminname", policyadminname);
				  request.setAttribute("username", username);
				  request.setAttribute("mode", "poassignmodel");
				  return "PolicyAdmin_dashboard";
		  
				  
	  }
	  @GetMapping("/policyacceptance")
	  public String assignmentsmodel2(HttpServletRequest request,@RequestParam("po_to_adac") String po_to_adac,@RequestParam("username") String username,@RequestParam("policyadminname") String policyadminname)
	  {User user=userservice.findByUsername(username);
		  if(po_to_adac.equals("true"))
			  userservice.po_to_adac(user);
		  else
			  userservice.po_to_adrej(user);
				 
					  
				
				  
				  return "redirect:/ad_to_po?username="+policyadminname+"";
		  
	  }
	  @GetMapping("/pologout")
	  public String assignments1012(HttpServletRequest request,@RequestParam("username") String username)
	  {
		       
				  request.setAttribute("policyadminname", username);
				  
				 
				 
				 
				  request.setAttribute("mode", "logout");
				  return "PolicyAdmin_dashboard";
		  
	  }
	  @RequestMapping("/policystay")
		public String showAllUsers178(HttpServletRequest request,@RequestParam("username") String username) {
			
			  request.setAttribute("policyadminname",username);
			 
			
			return "PolicyAdmin_dashboard";
		  
			
		}
	  @RequestMapping("/policyforgotpassword1")
	  public String home34(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "forgotpassword");
		  return "welcome_PolicyAdmin";
	  }
	  @RequestMapping("/policyupdatepassword")
	  public String h356(@ModelAttribute() policyadmin user,BindingResult bind,HttpServletRequest request,@RequestParam("newpassword") String newpassword,@RequestParam("newpassword2") String newpassword2)
	  {
		  System.out.println(user);
		  policyadmin us=userser.findByUsernameAndMblnumberAndEmail(user.getUsername(),user.getMblnumber(),user.getEmail());
		  System.out.println(us);
		  if(us!=null) {
			 
			  
			   if(newpassword.equals(newpassword2))
			  {us.setPassword(newpassword);
			  userser.saveuser(us);
				  request.setAttribute("change","Password is changed Succesfully");
				  request.setAttribute("mode","forgotpassword");
				  return "welcome_PolicyAdmin";
			  }

			   else
			  {
				  request.setAttribute("error"," New passwords should match Correctly");
				  request.setAttribute("mode","forgotpassword");
				  return "welcome_PolicyAdmin";
			  }
			  
			}
		  else 
		  {
			  request.setAttribute("error","Username or mobilenumber or email are incorrect.");
			  request.setAttribute("mode","forgotpassword");
			  return "welcome_PolicyAdmin";
		  }
		
		 

		
	  }
	  @RequestMapping("/policyadminuserprofile")
	  public String home29(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {policyadmin us=userser.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("policyadminname", username);
		  request.setAttribute("mode", "userprofile");
		  return "PolicyAdmin_dashboard";
	  }
	  @RequestMapping("/policyadminedit")
	  public String home293(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {policyadmin us=userser.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("policyadminname", username);
		  request.setAttribute("mode", "edit");
		  return "PolicyAdmin_dashboard";
	  }
	  @RequestMapping("/policyadminsavedetails")
	  public String home2934(@ModelAttribute User user,HttpServletRequest request,@RequestParam("policyadminname") String policyadminname)
	  
	  {
		  policyadmin us=userser.findByUsername(policyadminname);
		 
	  us.setUsername(user.getUsername());
	  us.setEmail(user.getEmail());
	  us.setMblnumber(user.getMblnumber());
	  if(user.getDob()!=null) {
		  us.setDob(user.getDob());}
	  us.setFirstname(user.getFirstname());
	  us.setLastname(user.getLastname());
	  userser.saveuser(us);
	  
		  return "redirect:/policyadminuserprofile?username="+us.getUsername()+"";
	  }
	  
	  
	  @RequestMapping("/policyadminloginuser")
	  public String h3(@ModelAttribute() policyadmin user,BindingResult bind,HttpServletRequest request)
	  {policyadmin vip=userser.findByUsernamendPassword(user.getUsername(), user.getPassword());
		  if(vip!=null&&!vip.getPerm().equals("false")) {
			  policyadmin v=userser.findByUsernamendPassword(user.getUsername(), user.getPassword());
			  request.setAttribute("policyadminname", v.getUsername());
				return "PolicyAdmin_dashboard";
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
