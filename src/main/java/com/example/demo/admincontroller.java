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
	 
/*1.parameter is admin usernname
   2.It will show the all field officer and policy admin data who are waiting for approval of their login to respective dashboards
   3.it will return the a part of admin dashboard named registration requests*/
	@GetMapping("/registrationrequests")
	public String showAllUsers(HttpServletRequest request,@RequestParam("username") String username) {
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
		  List<User> usrs=new ArrayList<>();
			for(User p:userser.showusers())
			{
				if(p.getPolicyreq().equals("true"))
				usrs.add(p);
				
			}
			request.setAttribute("adminname", username);
			 request.setAttribute("mb",usrs);
		  request.setAttribute("mode","pr" );
		return "Admin_dashboard";
		
	}
	/*1.Parameter is admin usernname.
	   2.It will show the all field officer and policy admin and Customer who raised a query for help.
	   3.it will return the a part of admin dashboard name reports */
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
	/*1.parameter is admin usernname
	  
	   3.it will return the a part of admin dashboard named reply model which enables admin to reply to help queries*/
	@GetMapping("/replies")
	public String showAllUsers56(HttpServletRequest request,@RequestParam("username") String username,@RequestParam("adminname") String adminname,@RequestParam("category") String category) {
		
		
		
			request.setAttribute("username", username);
		request.setAttribute("category", category);
			request.setAttribute("adminname", adminname);
			
		request.setAttribute("mode","replies" );
		  
		 
		return "Admin_dashboard";
		
	}
	/*1.parameter are username,category of user who admin is replying and adminname
	   2.It will save date replied by admin to database of user of respected category 
	   3.it will redirect the a part of admin dashboard named reports again*/
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
	/*1.parameter is admin usernname
	   2.It will show the all customer user data who applied for approval of their policy Insurance
	   3.it will return the a part of admin dashboard named policyrequests*/
	
	@GetMapping("/policyrequests")
	public String showAllUsers2(HttpServletRequest request,@RequestParam("username") String username ) {
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getPolicyreq().equals("true"))
			usrs.add(p);
			
		}
		

		request.setAttribute("adminname", username);
		 request.setAttribute("mb",usrs);
		
		 request.setAttribute("mode","pre" );
		
		  return "Admin_dashboard";
		
		
	}
	/*1.parameter is admin usernname and id of customer whose request is sending for verification to fieldofficer
	   2.Again It will show the all customer data who aplied for policyrequests except the ones whose request are send for verification.
	   3.it will return the a part of admin dashboard named policyrequests*/
	@RequestMapping("/ad_to_fo")
	public String showAllUsers23(HttpServletRequest request,@RequestParam int id,@RequestParam("username") String username) {
		userser.ad_to_fo(id);
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getPolicyreq().equals("true"))
			usrs.add(p);
			
		}
		

		request.setAttribute("adminname", username);
		 request.setAttribute("mb",usrs);
		
		 request.setAttribute("mode","pre" );
		
		  return "Admin_dashboard";
		
		
	}
	/*1.parameter is admin usernname and id of customer whose request is sending for approval to policyadmin
	   2.Again It will show the all customer data whose verification is verified and accepted from fieldofficer.
	   3.it will redirect to the a part of admin dashboard named policyAfterValidation*/
	
	@RequestMapping("/ad_to_pol")
	public String showAllUsers237(HttpServletRequest request,@RequestParam int id,@RequestParam("username") String username) {
		userser.ad_to_po(id);
	
		  return "redirect:/fo_to_adac?username="+username+"";
		
		
	}
	/*1.Parameter is admin usernname.
	   2.It will show the all Customer data whose policyrequest is approved from policyadmin
	   3.it will return the a part of admin dashboard named ApprovedPolicy */
	@RequestMapping("/po_to_adac")
	public String showAllUsers234(HttpServletRequest request,@RequestParam("username") String username) {
		
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getPo_to_adac().equals("true"))
			usrs.add(p);
			
		}
		

		 request.setAttribute("mber",usrs);
		request.setAttribute("adminname",username);
		 request.setAttribute("mode","ap" );
		
		  return "Admin_dashboard";
		
		
	}
	/*1.Parameter is admin usernname.
	   2.It will show the all Customer data whose policyrequest is verified and accepted from fieldofficer
	   3.it will return the a part of admin dashboard named PolicyAftervadlidation */
	@RequestMapping("/fo_to_adac")
	public String showAllUsers23456(HttpServletRequest request,@RequestParam("username") String username) {
		
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getFo_to_adac().equals("true"))
			usrs.add(p);
			
		}

		 request.setAttribute("mbe",usrs);
		request.setAttribute("adminname", username);
		 request.setAttribute("mode","vp" );
		
		  return "Admin_dashboard";
		
		
	}
	/*1.Parameter is admin usernname.
	   2.It will show the all Customer data whose policyrequest is rejected by fieldOfficer or policyadmin
	   3.it will return the a part of admin dashboard named RejectedPolicy */
	@RequestMapping("/fo_to_adrej&po_to_adrej")
	public String showAllUsers2345(HttpServletRequest request,@RequestParam("username") String username) {
		
		List<User> usrs=new ArrayList<>();
		for(User p:userser.showusers())
		{
			if(p.getFo_to_adrej().equals("true")||p.getPo_to_adrej().equals("true"))
			usrs.add(p);
			
		}
		

		request.setAttribute("adminname", username);
		 request.setAttribute("rejs",usrs);
		
		 request.setAttribute("mode","rjp" );
		
		  return "Admin_dashboard";
		
		
	}
	/*1.parameter is admin usernname and id and  category of user either policyadmin or fieldoffficer who are waiting for approval of thie login to their respective dashboard.
	   2.Delete the data of user if admin denied thier request and Again It will show the all field officer and policy admin data who are waiting for approval of their login to respective dashboards excepted whose requests are denied.
   3.it will return the a part of admin dashboard named registration requests*/
	
	@RequestMapping("/admindelete-user")
	public String showAllUsers1(HttpServletRequest request,@RequestParam int id,@RequestParam String category,@RequestParam("username") String username) {
		
		
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
	/*1.parameter is admin usernname and id and  category of user either policyadmin or fieldoffficer who are waiting for approval of thie login to their respective dashboard.
	   2.Accept the request of user and Again It will show the all field officer and policy admin data who are waiting for approval of their login to respective dashboards excepted whose requests are accepted.
3.it will return the a part of admin dashboard named registration requests*/
	@RequestMapping("/adminaccept-user")
	public String showAllUsers2(HttpServletRequest request,@RequestParam int id,@RequestParam String category,@RequestParam("username") String username) {
		
		
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
	/*1.Parameter is admin usernname.
	   2.it will remain in admindashboard when admin clicked no option when logout.
	  */
	@RequestMapping("/adminstay")
	public String showAllUsers178(HttpServletRequest request,@RequestParam("username") String username) {
		
		  request.setAttribute("adminname",username);
		 
		
		return "Admin_dashboard";
	  
		
	}
	/*1.Parameter is admin usernname.
	   2.it will return part of  admindashboard named logout.
	  */
	
	@RequestMapping("/adminlogout")
	public String showAllUsers17(HttpServletRequest request,@RequestParam("username") String username) {
		
		  request.setAttribute("adminname",username);
		  request.setAttribute("mode", "logout");
		
		return "Admin_dashboard";
	  
		
	}
	/*1.Parameter is admin usernname.
	   2.it will return part of  Welcome_admin named forgotpassword.
	  */
	
	 @RequestMapping("/adminforgotpassword1")
	  public String home34(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "forgotpassword");
		  return "welcome_Admin";
	  }
	 /*1.Parameter is  username as Admin object and two same new passwords.
	  2.It will check the username  and old password is correct and change password
	   3.it will return part of  Welcome_admin named forgotpassword with message of password change is done or not.
	  */
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
	  /*1.Parameter is admin usernname.
	   2.It will fetch the user data .
	   3.it will return the part of  Admin_dashboard named userprofile.
	  */
	  @RequestMapping("/adminuserprofile")
	  public String home29(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {Admin us=serv.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("adminname", username);
		  request.setAttribute("mode", "userprofile");
		  return "Admin_dashboard";
	  }
	  /*1.Parameter is admin usernname.
	   2.It will fetch the user data and give option to edit.
	   3.it will return the part of  Admin_dashboard named edit.
	  */
	  @RequestMapping("/adminedit")
	  public String home293(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {Admin us=serv.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("adminname", username);
		  request.setAttribute("mode", "edit");
		  return "Admin_dashboard";
	  }
	  /*1.Parameter is admin usernname.
	   2.It will save edited  user data to database.
	   3.it will return the part of  Admin_dashboard named userprofile.
	  */
	  @RequestMapping("/adminsavedetails")
	  public String home2934(@ModelAttribute Admin user,HttpServletRequest request,@RequestParam("adminname") String adminname)
	  
	  {
		  Admin us=serv.findByUsername(adminname);
		 
	  us.setUsername(user.getUsername());
	 
	  serv.saveuser(us);
	  
		  return "redirect:/adminuserprofile?username="+us.getUsername()+"";
	  }

	  /*
	   1.it will return the part of  welocme_Admin named login.
	  */
	  @RequestMapping("/adminlogin")
	  public String home3(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_adminlogin");
		  
		  return "welcome_Admin";
	  }
	  /*1.Parameter is data in type of Admin object.
	   2.It will check the the credentials are correct or not and allow to login into the admin_dashboard.
	   3.it will return the part of  Admin_dashboard or welcome_admin based on 2..
	  */
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

			  return "welcome_Admin";
		  }
		
	  }
}
