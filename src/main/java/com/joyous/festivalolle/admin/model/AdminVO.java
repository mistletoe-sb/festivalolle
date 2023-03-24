package com.joyous.festivalolle.admin.model;

public class AdminVO {

	private int adminCode;
	private String id;
	private String password;
	private int organizationCode;
	private String name;
	private String telephone;
	private String email;
	private String requesTime;
	private String approveTime;
	private int status;
		
	public AdminVO() {
		super();
	}
	
	public int getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(int adminCode) {
		this.adminCode = adminCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(int organizationCode) {
		this.organizationCode = organizationCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRequesTime() {
		return requesTime;
	}
	public void setRequesTime(String requesTime) {
		this.requesTime = requesTime;
	}
	public String getApproveTime() {
		return approveTime;
	}
	public void setApproveTime(String approveTime) {
		this.approveTime = approveTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdminVO [adminCode=" + adminCode + ", id=" + id + ", password=" + password + ", organizationCode="
				+ organizationCode + ", name=" + name + ", telephone=" + telephone + ", email=" + email
				+ ", requesTime=" + requesTime + ", approveTime=" + approveTime + ", status=" + status + "]";
	}
	
	
	
}
