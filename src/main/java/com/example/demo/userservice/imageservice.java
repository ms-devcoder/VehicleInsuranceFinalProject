package com.example.demo.userservice;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.modal.image;
import com.example.demo.repository.imagerepo;

@Service
@Transactional
public class imageservice {
	@Autowired
private imagerepo imgrep;
	public void upload(MultipartFile file,String name)
	{String filename=file.getOriginalFilename();
	try {
	if(imgrep.findByName(name)!=null)
	{
		imgrep.deleteByName(name);
	}}
	catch(Exception p)
	{
		p.printStackTrace();
	}
	
	try {
		image img=new image(name,file.getContentType(),file.getBytes(),filename);
		 imgrep.save(img);
		 
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		
	}
	
	public image getimg(String username)
	{
		return imgrep.findByName(username);
	}
	
	public List<image> getall()
	{
		return (List<image>) imgrep.findAll();
	}
	
}
