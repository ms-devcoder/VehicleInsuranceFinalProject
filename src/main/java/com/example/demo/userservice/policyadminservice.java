package com.example.demo.userservice;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modal.User;
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


}
