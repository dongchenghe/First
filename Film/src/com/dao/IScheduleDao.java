package com.dao;

import java.util.List;
import java.util.Map;

import com.bean.Film;
import com.bean.Schedule;

public interface IScheduleDao {
	List<Schedule> getCurrentSchedule(Map map);
	List<Schedule> getSchedules(Schedule schedule);
}
