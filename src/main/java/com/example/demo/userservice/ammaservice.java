package com.example.demo.userservice;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modal.ammar;
import com.example.demo.repository.ammarrepo;

@Service
@Transactional
public class ammaservice {
	@Autowired
	private ammarrepo userre;
	public void saveuser(ammar user)
	{
		userre.save(user);
	}
	

}
