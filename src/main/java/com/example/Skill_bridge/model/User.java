package com.example.Skill_bridge.model;

public class User {
	
	// At the time of registration
    private String name;
    private String mobile;
    private String email;
    private String password;
    private String domain;
    
    // Updating and creating new values in the profile page
    private String address1;
    private String address2;
    private String postcode;
    private String state;
    private String city;
    private String education;
    private String country;
    private String profilePictureUrl;
    
    
	public User() {
    	
    }

    public User(String name, String mobile, String email, String password, String domain,
    		String address1, String address2, String postcode, String state, String city,
    		String education, String country) {
        this.name = name;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
        this.domain = domain;
        this.address1 = address1;
        this.address2 = address2;
        this.postcode = postcode;
        this.state = state;
        this.city = city;
        this.education = education;
        this.country = country;
        
        
    }

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public  String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}
	
	public String getProfilePictureUrl() {
	    return profilePictureUrl;
	}

	public void setProfilePictureUrl(String profilePictureUrl) {
	    this.profilePictureUrl = profilePictureUrl;
	}

    
}
