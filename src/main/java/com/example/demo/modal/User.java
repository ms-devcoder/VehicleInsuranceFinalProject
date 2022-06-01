package com.example.demo.modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usertable")
public class User {
	@Id
	 int id;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String dob;
	private String gender;
	private String mblnumber;
	private String lnumber;
	private String email;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMblnumber() {
		return mblnumber;
	}
	public void setMblnumber(String mblnumber) {
		this.mblnumber = mblnumber;
	}
	public String getLnumber() {
		return lnumber;
	}
	public void setLnumber(String lnumber) {
		this.lnumber = lnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User()
	{
		
	}
	public User(String username, String password, String firstname, String lastname, String dob, String gender,
			String mblnumber, String lnumber, String email) {
		super();
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.gender = gender;
		this.mblnumber = mblnumber;
		this.lnumber = lnumber;
		this.email = email;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", dob=" + dob + ", gender=" + gender + ", mblnumber=" + mblnumber
				+ ", lnumber=" + lnumber + ", email=" + email + "]";
	}
	
	
	

}
