package com.example.demo.modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "policyadmintable")
public class policyadmin {
	@Id
	private int id;
	
	
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String dob;
	private String gender;
	private String mblnumber;
	
	private String email;
	private String designation;
	private String role;
	private String category;
	private String perm;
	private String concern;
	private String reply;
	public String getCategory() {
		return category;
	}
	public String getConcern() {
		return concern;
	}
	public void setConcern(String concern) {
		this.concern = concern;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public policyadmin()
	{
		
	}
	public policyadmin(String username, String password, String firstname, String lastname, String dob, String gender,
			String mblnumber,String email, String designation, String role,String category,String perm,String concern,String reply) {
		super();
		
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.gender = gender;
		this.mblnumber = mblnumber;
		this.category=category;
		this.email = email;
		this.designation = designation;
		this.role = role;
		this.perm=perm;
	}
	
	public void setPerm(String perm) {
		this.perm = perm;
	}
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
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "policyadmin [id=" + id + ", username=" + username + ", password=" + password + ", firstname="
				+ firstname + ", lastname=" + lastname + ", dob=" + dob + ", gender=" + gender + ", mblnumber="
				+ mblnumber + ", email=" + email + ", designation=" + designation + ", role=" + role + ", category="
				+ category + ", perm=" + perm + ", concern=" + concern + ", reply=" + reply + "]";
	}
	public String getPerm() {
		// TODO Auto-generated method stub
		return perm;
	}
	
	

}
