package com.example.demo.modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ammartable")
public class ammar {
	@Id
	private int id;
	private String userid;
	private String name;
	public ammar()
	{
		
	}
	public ammar(String userid, String name) {
		super();
		this.userid = userid;
		this.name = name;
	}
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ammar [id=" + id + ", userid=" + userid + ", name=" + name + "]";
	}
	

}
