package com.example.demo.repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.modal.Admin;


public interface adminrepo extends CrudRepository<Admin, Integer> {
	public Admin findByUsernameAndPassword(String username,String password);

	public Admin findByUsername(String username);
}
