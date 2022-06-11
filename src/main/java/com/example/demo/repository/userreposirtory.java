package com.example.demo.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.modal.User;


public interface userreposirtory extends CrudRepository<User, Integer>{

	public User findByUsernameAndPassword(String username,String password);
	public User findByUsername(String username);
	public User findByEmail(String email);
	public User findByUsernameAndMblnumberAndEmail(String username,String mblnumber,String email);
	
	
	
}
