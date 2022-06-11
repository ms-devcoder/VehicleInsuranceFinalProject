package com.example.demo;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.StreamingHttpOutputMessage.Body;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.modal.User;
import com.example.demo.modal.image;
import com.example.demo.userservice.Userservice;
import com.example.demo.userservice.imageservice;


@Controller
public class imagecontroller {
	@Autowired
	private imageservice imgser;
	@Autowired
	private Userservice userser;
	@PostMapping("/uploadfiles")
	
	public String uploadfile(HttpServletRequest request,@RequestParam("image") MultipartFile files,@ModelAttribute image userp)
	{
		System.out.println(userp);
		
			 imgser.upload(files,userp.getName());
			 User us=userser.findByUsername(userp.getName());
			 if(us.getFo_to_adrej().equals("true")||us.getPo_to_adrej().equals("true"))
			 {
				 us.setAd_to_fo("false");
				 us.setAd_to_po("false");
				 us.setFo_to_adac("false");
				 us.setFo_to_adrej("false");
				 us.setPo_to_adac("false");
				 us.setPo_to_adrej("false");
				 us.setPolicyreq("false");
				 us.setPolicyaccept("false");
			 }
			 else if(us.getPolicyreq().equals("sent")||us.getPolicyreq().equals("true"))
			 {
				 return "redirect:/newpolicyrequest?username="+us.getUsername()+"";
			 }
			 userser.policyreqsaveuser(us);
		
		return "redirect:/newpolicyrequest?username="+userp.getName()+"";
	}
	@RequestMapping("/newpolicies")
	public String po(HttpServletRequest request,@ModelAttribute User us)
	
	{   
		request.setAttribute("mode", "mode_newpolicies");
		return "ct_dashboard"; 
	}
	@GetMapping("/allimages")
	public String allimages(HttpServletRequest request)
	{
		List<image> allimages=imgser.getall();
		request.setAttribute("images", allimages);
		
		return "customer_dashboard";
	}
	@GetMapping("/download")
	public ResponseEntity<ByteArrayResource> download(@RequestParam String username)
	{
		image img=imgser.getimg(username);
//		return ResponseEntity.ok().contentType(MediaType.parseMediaType(img.getFiletype())).header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename\""+img.getFilename()+"\"").body(new ByteArrayResource(img.getBytes()));
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(img.getFiletype()))
				.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+img.getFilename()+"\"")
				.body(new ByteArrayResource(img.getBytes()));
	}
	

}
