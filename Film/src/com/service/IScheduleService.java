package com.service;

import java.util.List;

import com.bean.Film;
import com.bean.Schedule;


public interface IScheduleService {
	List<Schedule> getCurrentSchedule(String filmId);
	
}
