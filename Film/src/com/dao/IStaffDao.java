package com.dao;

import java.util.List;

import com.bean.Job;
import com.bean.Staff;

public interface IStaffDao {
	List<Job> getJobs();
	
	
	List<Staff> getStaffs(Staff staff);
	Staff getStaff(Staff staff);
	void updateStaff(Staff staff);
	void deleteStaff(Staff staff);
	void addStaff(Staff staff);
}
