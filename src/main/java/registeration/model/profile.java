package registeration.model;

import java.io.InputStream;

public class profile {
	private String role;
	private String fname;
	private String lname;
	private String uni;
	private String degree;
	private double rate;
	private String bio;
	private String skill;
	private String contact;
	private String address;
	private String email;
	private String inputStream; 

	public profile(String email,String role, String fname, String lname, String uni, String degree,String skill,String contact,String address, double rate, String bio,String inputStream) {
		super();
		this.email=email;
		this.role = role;
		this.fname = fname;
		this.lname = lname;
		this.uni = uni;
		this.degree = degree;
		this.skill=skill;
		this.contact=contact;
		this.address=address;
		this.rate = rate;
		this.bio = bio;
		this.inputStream=inputStream;
		
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUni() {
		return uni;
	}

	public void setUni(String uni) {
		this.uni = uni;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInputStream() {
		return inputStream;
	}

	public void setInputStream(String inputStream) {
		this.inputStream = inputStream;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
