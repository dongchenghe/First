package com.dao;

import java.util.List;

import com.bean.Film;
import com.bean.Schedule;

public interface IScheduleDao {
	List<Schedule> getCurrentSchedule(String filmId);
}
