package com.example.demo.userservice;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modal.Admin;
import com.example.demo.modal.fieldofficer;
import com.example.demo.repository.adminrepo;
import com.example.demo.repository.fieldofficerrepo;

@Service
@Transactional
public class adminservice {
	@Autowired
	private adminrepo userrep;
//		public void saveuser(fieldofficer user) {
//			// TODO Auto-generated method stub
//			userrep.save(user);
//			
//		}
//		public List<fieldofficer> showusers(){
//			List<fieldofficer> users = new ArrayList<fieldofficer>();
//			for( fieldofficer user : userrep.findAll()) {
//				users.add(user);
//			}
//			
//			return users;
//		}
//		public void delete(int id) {
//			// TODO Auto-generated method stub
//			userrep.deleteById(id);
//			
//		}
//		
//		public fieldofficer update(int id) {
//			// TODO Auto-generated method stub
//			return userrep.findById(id).orElse(null);
//		}
		public Admin findByUsernamendPassword(String username,String password)
		{
			return userrep.findByUsernameAndPassword(username,password);
		}
		public void saveuser(Admin us) {
			// TODO Auto-generated method stub
			userrep.save(us);
			
		}
		public Admin findByUsername(String username) {
			// TODO Auto-generated method stub
			return userrep.findByUsername(username);
		}

}
