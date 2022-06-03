package com.example.demo.repository;

import org.springframework.data.repository.CrudRepository;


import com.example.demo.modal.fieldofficer;


public interface fieldofficerrepo extends CrudRepository<fieldofficer, Integer> {
	public fieldofficer findByUsernameAndPassword(String username,String password);
}
