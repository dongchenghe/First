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
	public List<Schedule> getCurrentSchedule(Map map) {
		List<Schedule> list=dao.getCurrentSchedule(map);
		return list;
	}
	
	

}
