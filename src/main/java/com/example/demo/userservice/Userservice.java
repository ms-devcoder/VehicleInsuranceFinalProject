package com.example.demo.userservice;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modal.User;
import com.example.demo.modal.policyadmin;
import com.example.demo.repository.userreposirtory;




@Service
@Transactional
public class Userservice {
	@Autowired
userreposirtory userrep;
	public void saveuser(User user) {
		// TODO Auto-generated method stub
		userrep.save(user);
		
	}
	public void policyreqsaveuser(User user) {
		// TODO Auto-generated method stub
		user.setPolicyreq("true");
		
		userrep.save(user);
		
	}
	public void policyacceptsaveuser(User user) {
		// TODO Auto-generated method stub
		user.setPolicyaccept("true");
		userrep.save(user);
		
	}
	public void ad_to_fo(int id) {
		// TODO Auto-generated method stub
		
		User user=userrep.findById(id).orElse(null);
		user.setPolicyreq("sent");
		user.setAd_to_fo("true");
		userrep.save(user);
		
	}
	public void ad_to_po(int id) {
		// TODO Auto-generated method stub
		User user=userrep.findById(id).orElse(null);
		user.setFo_to_adac("false");
		user.setAd_to_po("true");
		userrep.save(user);
		
	}
	public void fo_to_adac(User user) {
		// TODO Auto-generated method stub
		user.setAd_to_fo("false");
		user.setFo_to_adac("true");
		userrep.save(user);
		
	}
	public void po_to_adac(User user) {
		// TODO Auto-generated method stub
		user.setPo_to_adac("true");
		userrep.save(user);
		
	}
	public void fo_to_adrej(User user) {
		// TODO Auto-generated method stub
		user.setFo_to_adrej("true");
		userrep.save(user);
		
	}
	public void po_to_adrej(User user) {
		// TODO Auto-generated method stub
		user.setPo_to_adrej("true");
		userrep.save(user);
		
	}
	
	public List<User> showusers(){
		List<User> users = new ArrayList<User>();
		for(User user : userrep.findAll()) {
			users.add(user);
		}
		
		return users;
	}
	public void delete(int id) {
		// TODO Auto-generated method stub
		userrep.deleteById(id);
		
	}
	
	public User update(int id) {
		// TODO Auto-generated method stub
		return userrep.findById(id).orElse(null);
	}
	public User findByUsernamendPassword(String username,String password)
	{
		return userrep.findByUsernameAndPassword(username,password);
	}
	public User findByUsername(String username)
	{
		return userrep.findByUsername(username);
	}
	
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userrep.findByEmail(email);
	}
	public User findByUsernameAndMblnumberAndEmail(String username,String mblnumber,String email)
	{
		return  userrep.findByUsernameAndMblnumberAndEmail(username, mblnumber, email);
	}
	
	
	
}
