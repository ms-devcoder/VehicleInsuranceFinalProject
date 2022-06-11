package com.example.demo.userservice;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modal.User;
import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.policyadmin;

import com.example.demo.repository.Policyrepo;
import com.example.demo.repository.userreposirtory;

@Service
@Transactional
public class policyadminservice {
	@Autowired
	Policyrepo userrep;
		public void saveuser(policyadmin user) {
			// TODO Auto-generated method stub
			
			userrep.save(user);
			
		}
		public void saveaccpteduser(int id)
		{
			policyadmin users=userrep.findById(id).orElse(null);
			users.setPerm("true");
			userrep.save(users);
		}
		public List<policyadmin> showusers(){
			List<policyadmin> users = new ArrayList<policyadmin>();
			for(policyadmin user : userrep.findAll()) {
				users.add(user);
			}
			
			return users;
		}
		public void delete(int id) {
			// TODO Auto-generated method stub
			userrep.deleteById(id);
			
		}
		
		public policyadmin update(int id) {
			// TODO Auto-generated method stub
			return userrep.findById(id).orElse(null);
		}
		public policyadmin findByUsernamendPassword(String username,String password)
		{
			return userrep.findByUsernameAndPassword(username,password);
		}
		public policyadmin findByUsername(String username)
		{
			return userrep.findByUsername(username);
		}
		
		public policyadmin findByUsernameAndMblnumberAndEmail(String username, String mblnumber, String email) {
			return userrep.findByUsernameAndMblnumberAndEmail(username,mblnumber,email);
		}


}
