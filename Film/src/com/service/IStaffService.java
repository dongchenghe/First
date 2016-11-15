package com.service;

import java.util.List;

import com.bean.Job;
import com.bean.Staff;

public interface IStaffService {
	//这个本该在IJobDao里的方法
	List<Job> getJobs();
	
	
	List<Staff> getStaffs(Staff staff);
	Staff getStaff(Staff staff);
	void updateStaff(Staff staff);
	void deleteStaff(Staff staff);
	void addStaff(Staff staff);
}
