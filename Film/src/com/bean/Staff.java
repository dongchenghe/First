package com.bean;

import java.io.Serializable;

public class Staff implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Staff() {
		super();
	}
	private String staffId;
	private String userName;
	private String pwd;
	@Override
	public String toString() {
		return "Staff [staffId=" + staffId + ", userName=" + userName + ", pwd=" + pwd + ", phone=" + phone + ", job="
				+ job + "]";
	}
	private String phone;
	private Job job;
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
}
