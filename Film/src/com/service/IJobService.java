package com.service;

import java.util.List;

import com.bean.Job;

public interface IJobService {
	List<Job> getJobs(Job job);
	void deleteJob(Job job);
	void updateJob(Job job);
	void addJob(Job job);
}
