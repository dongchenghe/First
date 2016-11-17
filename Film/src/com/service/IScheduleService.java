package com.service;

import java.util.List;
import java.util.Map;

import com.bean.Film;
import com.bean.Schedule;


public interface IScheduleService {
	List<Schedule> getCurrentSchedule(Schedule sch);
	List<Schedule> getSchedules(Schedule schedule);
}
