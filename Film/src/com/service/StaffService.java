package com.service;

import java.util.List;

import com.bean.Job;
import com.bean.Staff;
import com.dao.IStaffDao;

public class StaffService implements IStaffService{
	private IStaffDao dao;
	@Override
	public List<Staff> getStaffs(Staff staff) {
		return dao.getStaffs(staff);
	}

	@Override
	public Staff getStaff(Staff staff) {
		return dao.getStaff(staff);
	}

	@Override
	public void updateStaff(Staff staff) {
		dao.updateStaff(staff);
		
	}

	@Override
	public void deleteStaff(Staff staff) {
		dao.deleteStaff(staff);
		
	}

	@Override
	public void addStaff(Staff staff) {
		dao.addStaff(staff);
		
	}

	public IStaffDao getDao() {
		return dao;
	}

	public void setDao(IStaffDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Job> getJobs() {
		
		return dao.getJobs();
	}
}
