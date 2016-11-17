package com.service;

import java.util.List;
import java.util.Map;

import com.bean.FilmHall;
import com.bean.Schedule;
import com.dao.IFilmHallDao;
import com.dao.IScheduleDao;


public class ScheduleService implements IScheduleService {
	private IScheduleDao dao;
	
	public IScheduleDao getDao() {
		return dao;
	}

	public void setDao(IScheduleDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Schedule> getSchedules(Schedule schedule) {
		// TODO Auto-generated method stub
		return dao.getSchedules(schedule);
	}

	@Override
	public List<Schedule> getCurrentSchedule(Schedule sch) {
		// TODO Auto-generated method stub
		return dao.getCurrentSchedule(sch);
	}
	
	

}
