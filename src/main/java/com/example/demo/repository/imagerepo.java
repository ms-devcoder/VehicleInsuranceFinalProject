package com.example.demo.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.modal.image;

public interface imagerepo extends JpaRepository<image, Integer> {
 
	public image findByName(String username);
	public image deleteByName(String username);
	
	
}
