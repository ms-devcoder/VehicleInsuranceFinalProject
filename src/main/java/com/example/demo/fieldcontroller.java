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


@Controller
public class fieldcontroller {
	@Autowired
	  private fieldservice userser;
	@Autowired
	private Userservice userservice;
	 /*
	  1.it will return the part of  welcome_fieldofficer named fieldoffcierregister.
	 */
	  @RequestMapping("/fieldofficerregister")
	  public String home2(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_fieldofficerregister");
		  return "welcome_fieldofficer";
	  }
	  /*
	  1.parameters are fieldoffcier username.
	  2.it show all customers data which sent for verification by admin
	  3.it will return the part of  welcome_fieldofficer named myassigns.
	 */
	  @GetMapping("/myassignments")
	  public String assignments(HttpServletRequest request,@RequestParam("username") String username)
	  {
		  List<User> users=new ArrayList<>();
				  for(User user:userservice.showusers())
				  {if(user.getAd_to_fo().equals("true")&&user.getFo_to_adac().equals("false")&&user.getFo_to_adrej().equals("false"))
				  {
					  users.add(user);
				  }
				 
					  
				  }
				  request.setAttribute("fieldofficername", username);
				  request.setAttribute("cpr", users);
				  request.setAttribute("mode", "myassigns");
				  return "fieldOfficer_dashboard";
		  
	  }
	  /*1.Parameters are fieldofficer username .
	  2.It will give allowance to fieldofficer to raise help ticket to amdin and show concern and replies on dahboard.
	   3.it will return the part of  fieldofficer_dashboard named help.
	 */
	  @GetMapping("/fieldhelp")
	  public String assignments9(HttpServletRequest request,@RequestParam("username") String username)
	  {
		       fieldofficer us=userser.findByUsername(username);
		       System.out.println(us);
				  request.setAttribute("fieldofficername", username);
				  request.setAttribute("concern",us.getConcern());
				  request.setAttribute("reply", us.getReply());
				 
				 
				  request.setAttribute("mode", "help");
				  return "fieldOfficer_dashboard";
		  
	  }
	  /*1.Parameters are fieldofficer username .
	  2.It will give allowance to fieldofficer to raise help ticket to amdin 
	   3.it will return the part of fieldofficer_dashboard named raiseticket.
	 */
	  @GetMapping("/raiseticket")
	  public String assignments10(HttpServletRequest request,@RequestParam("username") String username)
	  {
		       
				  request.setAttribute("fieldofficername", username);
				  
				 
				 
				 
				  request.setAttribute("mode", "raiseticket");
				  return "fieldOfficer_dashboard";
		  
	  }
	  /*1.Parameters are fieldofficer username .
	  2.It will give allowance to fieldofficer to verify proofs of customers send to amdin 
	   3.it will return the part of fieldofficer_dashboard named myassignmodel.
	 */
	  @GetMapping("/myassignmodel")
	  public String assignmentsmodel(HttpServletRequest request,@RequestParam String username,@RequestParam("fieldofficername") String fieldofficername)
	  {
		  
				 
					  
				request.setAttribute("fieldofficername", fieldofficername);
				  request.setAttribute("cmd", username);
				  request.setAttribute("mode", "myassignmodel");
				  return "fieldOfficer_dashboard";
		  
	  }
	  /*1.Parameter is fieldofficer usernname and cocern.
	   2.It will save the concern given by fieldofficer to database
	  3.it will return part of  fieldofficer_dashboard named help.
	 */
	  @RequestMapping("/ticketfromfo_to_ad")
	  public String home39(HttpServletRequest request,@RequestParam("concern") String concern,@RequestParam("username") String username)
	 

	  {
		 
		  fieldofficer us=userser.findByUsername(username);
		  us.setConcern(concern);
		  us.setReply("");
		  userser.saveuser(us);
	 
		  
		  return "redirect:/fieldhelp?username="+username+"";
	  }
	  /*1.Parameter is fieldofficer and customer usernname and result of verification.
	   2.It will save the customer policy request proofs acceptance and rejection
	  3.it will return part of  fieldofficer_dashboard named myassignmenyts.
	 */
	  @GetMapping("/bikevalidation")
	  public String assignmentsmodel2(HttpServletRequest request,@RequestParam("fo_to_adac") String fo_to_adac,@RequestParam("username") String username,@RequestParam("fieldofficername") String fieldofficername)
	  {User user=userservice.findByUsername(username);
		  if(fo_to_adac.equals("true"))
			  userservice.fo_to_adac(user);
		  else
			  userservice.fo_to_adrej(user);
				 
					  
				
				  
				  return "redirect:/myassignments?username="+fieldofficername+"";
		  
	  }
	  /*1.Parameters are fieldofficerdata.
	  2.It will save fieldofficer data to database and throw error if user didnt registered giving credentials according to conditions. 
	  3.it will return the part of welcome_fieldofficer named mode_fieldofficerregistered.
	 */
	  @PostMapping("/fieldofficersave-user")
	  public String home3(@ModelAttribute fieldofficer user,BindingResult bind,HttpServletRequest request)
	 

	  {
		  userser.saveuser(user);
	 
		  request.setAttribute("mode", "mode_fieldofficerregistered");
		  return "welcome_fieldofficer";
	  }
	  /*1.Parameter is fieldofficer usernname.
	  2.it will return part of fieldofficer_dashboard named logout.
	 */
	  @GetMapping("/fologout")
	  public String assignments10123(HttpServletRequest request,@RequestParam("username") String username)
	  {
		       
				  request.setAttribute("fieldofficername", username);
				  
				 
				 
				 
				  request.setAttribute("mode", "logout");
				  return "fieldOfficer_dashboard";
		  
	  }
	  /*1.Parameter is fieldofficer usernname.
	  2.it will remain in fieldofficer_dashboard when customer clicked no option when logout.
	 */
	  
	  @RequestMapping("/fieldstay")
		public String showAllUsers178(HttpServletRequest request,@RequestParam("username") String username) {
			
			  request.setAttribute("fieldofficername",username);
			 
			
			return "fieldOfficer_dashboard";
		  
			
		}
	  /*1.Parameter is fieldofficer usernname.
	  2.it will return part of  Welcome_fieldofficer named forgotpassword.
	 */

	  @RequestMapping("/fieldforgotpassword1")
	  public String home34(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "forgotpassword");
		  return "welcome_fieldofficer";
	  }
	  /*1.Parameter is  username as fieldofficer object and two same new passwords.
	  2.It will check the username  and email and mblnumber is correct and change password
	   3.it will return part of  Welcome_fieldofficer named forgotpassword with message of password change is done or not.
	  */
	  @RequestMapping("/fieldupdatepassword")
	  public String h356(@ModelAttribute() fieldofficer user,BindingResult bind,HttpServletRequest request,@RequestParam("newpassword") String newpassword,@RequestParam("newpassword2") String newpassword2)
	  {
		 
		  fieldofficer us=userser.findByUsernameAndMblnumberAndEmail(user.getUsername(),user.getMblnumber(),user.getEmail());
		  
		  if(us!=null) {
			 
			  
			   if(newpassword.equals(newpassword2))
			  {us.setPassword(newpassword);
			  userser.saveuser(us);
				  request.setAttribute("change","Password is changed Succesfully");
				  request.setAttribute("mode","forgotpassword");
				  return "welcome_fieldofficer";
			  }

			   else
			  {
				  request.setAttribute("error"," New passwords should match Correctly");
				  request.setAttribute("mode","forgotpassword");
				  return "welcome_fieldofficer";
			  }
			  
			}
		  else 
		  {
			  request.setAttribute("error","Username or mobilenumber or email are incorrect.");
			  request.setAttribute("mode","forgotpassword");
			  return "welcome_fieldofficer";
		  }
		
		 

		
	  }
	  /*1.Parameter is fieldofficer usernname.
	  2.It will fetch the user data and give option to edit.
	  3.it will return the part of fieldofficer_dashboard named edit.
	 */
	  @RequestMapping("/fielduserprofile")
	  public String home29(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {fieldofficer us=userser.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("fieldofficername", username);
		  request.setAttribute("mode", "userprofile");
		  return "fieldOfficer_dashboard";
	  }
	  /*1.Parameter is fieldofficer usernname.
	  2.It will fetch the user data and give option to edit.
	  3.it will return the part of  fieldofficer_dashboard named edit.
	 */
	  @RequestMapping("/fieldedit")
	  public String home293(HttpServletRequest request,@RequestParam("username") String username)
	  
	  {fieldofficer us=userser.findByUsername(username);
	  request.setAttribute("user", us);
		  request.setAttribute("fieldofficername", username);
		  request.setAttribute("mode", "edit");
		  return "fieldOfficer_dashboard";
	  }
	  /*1.Parameter is fieldofficer usernname.
	  2.It will save edited  user data to database.
	  3.it will return the part of  fieldofficer_dashboard named userprofile.
	 */
	  @RequestMapping("/fieldsavedetails")
	  public String home2934(@ModelAttribute User user,HttpServletRequest request,@RequestParam("fieldofficername") String fieldofficername)
	  
	  {
		  fieldofficer us=userser.findByUsername(fieldofficername);
		 
	  us.setUsername(user.getUsername());
	  us.setEmail(user.getEmail());
	  us.setMblnumber(user.getMblnumber());
	  if(user.getDob()!=null) {
	  us.setDob(user.getDob());}
	  us.setFirstname(user.getFirstname());
	  us.setLastname(user.getLastname());
	  userser.saveuser(us);
	  
		  return "redirect:/fielduserprofile?username="+us.getUsername()+"";
	  }
	  
	  /*
	  1.it will return the part of  welocme_fieldofficer named login.
	 */
	  @RequestMapping("/fieldofficerlogin")
	  public String home3(HttpServletRequest request)
	  
	  {
		  request.setAttribute("mode", "mode_fieldofficerlogin");
		  
		  return "welcome_fieldofficer";
	  }
	  /*1.Parameter is data in type of fieldofficer object.
	  2.It will check the the credentials are correct or not and allow to login into the fieldofficer_dashboard.
	  3.it will return the part of fieldofficer_dashboard or welcome_fieldofficer based on point 2.
	 */
	  @RequestMapping("/fieldofficerloginuser")
	  public String h3(@ModelAttribute() fieldofficer user,BindingResult bind,HttpServletRequest request)
	  {
		  fieldofficer vip=userser.findByUsernamendPassword(user.getUsername(), user.getPassword());
		  if(vip!=null&&!vip.getPerm().equals("false")) {
			  System.out.println(userser.findByUsernamendPassword(user.getUsername(), user.getPassword()));
			  request.setAttribute("fieldofficername", vip.getUsername());
				return "fieldOfficer_dashboard";
			}
		  else
		  {
			  
			  request.setAttribute("error", "Invalid,Username Or Password");
			  request.setAttribute("mode", "mode_fieldofficerlogin");

			  return "welcome_fieldofficer";
		  }
		
	  }
}
