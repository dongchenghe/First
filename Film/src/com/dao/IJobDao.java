package com.dao;

import java.util.List;

import com.bean.Job;

public interface IJobDao {
	List<Job> getJobs(Job job);
	void deleteJob(Job job);
	void updateJob(Job job);
	void addJob(Job job);
}
