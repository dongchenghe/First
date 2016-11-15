package com.bean;

import java.io.Serializable;

public class Job implements Serializable{
	@Override
	public String toString() {
		return "Job [jobId=" + jobId + ", jobName=" + jobName + "]";
	}
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String jobId;
	private String jobName;
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

}
