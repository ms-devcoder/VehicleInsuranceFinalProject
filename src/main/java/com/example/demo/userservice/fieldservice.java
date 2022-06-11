package com.example.demo.userservice;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.modal.fieldofficer;
import com.example.demo.modal.policyadmin;
import com.example.demo.repository.fieldofficerrepo;


@Service
@Transactional
public class fieldservice {
	@Autowired
	fieldofficerrepo userrep;
		public void saveuser(fieldofficer user) {
			// TODO Auto-generated method stub
			userrep.save(user);
			
		}
		public List<fieldofficer> showusers(){
			List<fieldofficer> users = new ArrayList<fieldofficer>();
			for( fieldofficer user : userrep.findAll()) {
				users.add(user);
			}
			
			return users;
		}
		public void saveaccpteduser(int id)
		{
			fieldofficer users=userrep.findById(id).orElse(null);
			users.setPerm("true");
			userrep.save(users);
		}
		public void delete(int id) {
			// TODO Auto-generated method stub
			userrep.deleteById(id);
			
		}
		
		public fieldofficer update(int id) {
			// TODO Auto-generated method stub
			return userrep.findById(id).orElse(null);
		}
		public fieldofficer findByUsernamendPassword(String username,String password)
		{
			return userrep.findByUsernameAndPassword(username,password);
		}
		public fieldofficer findByUsername(String username)
		{
			return userrep.findByUsername(username);
		}
		public fieldofficer findByUsernameAndMblnumberAndEmail(String username, String mblnumber, String email) {
			// TODO Auto-generated method stub
			return userrep.findByUsernameAndMblnumberAndEmail(username,mblnumber,email);
		}
		

}
