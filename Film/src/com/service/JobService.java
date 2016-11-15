package com.service;
import java.util.List;
import com.bean.Job;
import com.dao.IJobDao;

public class JobService implements IJobService{
	private IJobDao dao;
	@Override
	public List<Job> getJobs(Job job) {
		// TODO Auto-generated method stub
		return dao.getJobs(job);
	}

	@Override
	public void deleteJob(Job job) {
		dao.deleteJob(job);
		
	}

	@Override
	public void updateJob(Job job) {
		dao.updateJob(job);
		
	}

	@Override
	public void addJob(Job job) {
		dao.addJob(job);
		
	}

	public IJobDao getDao() {
		return dao;
	}

	public void setDao(IJobDao dao) {
		this.dao = dao;
	}

	
	
}
