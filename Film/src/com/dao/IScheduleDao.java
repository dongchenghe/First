package com.dao;

import java.util.List;
import java.util.Map;

import com.bean.Film;
import com.bean.Schedule;

public interface IScheduleDao {
	List<Schedule> getCurrentSchedule(Schedule sch);
	List<Schedule> getSchedules(Schedule schedule);
	void updateSchedule(Schedule schedule);
}
