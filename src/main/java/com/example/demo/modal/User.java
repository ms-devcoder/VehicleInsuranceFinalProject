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
	private String policyreq;
	private String policyaccept;
	private String ad_to_fo;
	private String fo_to_adac;
	private String fo_to_adrej;
	private String ad_to_po;
	private String po_to_adac;
	private String po_to_adrej;
	private String concern;
	private String reply;
	private String review;
	
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
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
	public String getAd_to_fo() {
		return ad_to_fo;
	}
	public void setAd_to_fo(String ad_to_fo) {
		this.ad_to_fo = ad_to_fo;
	}
	public String getFo_to_adac() {
		return fo_to_adac;
	}
	public void setFo_to_adac(String fo_to_adac) {
		this.fo_to_adac = fo_to_adac;
	}
	public String getFo_to_adrej() {
		return fo_to_adrej;
	}
	public void setFo_to_adrej(String fo_to_adrej) {
		this.fo_to_adrej = fo_to_adrej;
	}
	public String getAd_to_po() {
		return ad_to_po;
	}
	public void setAd_to_po(String ad_to_po) {
		this.ad_to_po = ad_to_po;
	}
	public String getPo_to_adac() {
		return po_to_adac;
	}
	public void setPo_to_adac(String po_to_adac) {
		this.po_to_adac = po_to_adac;
	}
	public String getPo_to_adrej() {
		return po_to_adrej;
	}
	public void setPo_to_adrej(String po_to_adrej) {
		this.po_to_adrej = po_to_adrej;
	}
	public String getPolicyreq() {
		return policyreq;
	}
	public void setPolicyreq(String policyreq) {
		this.policyreq = policyreq;
	}
	public String getPolicyaccept() {
		return policyaccept;
	}
	public void setPolicyaccept(String policyaccept) {
		this.policyaccept = policyaccept;
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
			String mblnumber, String lnumber, String email,String policyreq,String policyaccept,String ad_to_fo,String fo_to_adac,String fo_to_adrej,String ad_to_po,String po_to_adac,String po_to_adrej,String concern,String reply,String review) {
		super();
		this.review=review;
		this.username = username;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.gender = gender;
		this.mblnumber = mblnumber;
		this.lnumber = lnumber;
		this.email = email;
		this.policyreq=policyreq;
		this.policyaccept=policyaccept;
		this.ad_to_fo=ad_to_fo;
		this.fo_to_adac=fo_to_adac;
		this.fo_to_adrej=fo_to_adrej;
		this.ad_to_po=ad_to_po;
		this.po_to_adac=po_to_adac;
		this.po_to_adrej=po_to_adrej;
		this.concern=concern;
		this.reply=reply;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstname=" + firstname
				+ ", lastname=" + lastname + ", dob=" + dob + ", gender=" + gender + ", mblnumber=" + mblnumber
				+ ", lnumber=" + lnumber + ", email=" + email + ", policyreq=" + policyreq + ", policyaccept="
				+ policyaccept + ", ad_to_fo=" + ad_to_fo + ", fo_to_adac=" + fo_to_adac + ", fo_to_adrej="
				+ fo_to_adrej + ", ad_to_po=" + ad_to_po + ", po_to_adac=" + po_to_adac + ", po_to_adrej=" + po_to_adrej
				+ ", concern=" + concern + ", reply=" + reply + ", review=" + review + "]";
	}
	
	
	

}
