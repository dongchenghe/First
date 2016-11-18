package com.service;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import com.bean.Cinema;
import com.bean.Film;
import com.bean.FilmHall;
import com.bean.Schedule;
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

	@Override
	public List<Schedule> getCurrentScheduleDay(Cinema cinema, String filmid, String day) {
		List<Schedule> slist1 = new ArrayList<Schedule>();
		Schedule sch = new Schedule();
		sch.setFilm(new Film());
		sch.getFilm().setFilmId(filmid);
		sch.setFilmHall(new FilmHall());
		sch.getFilmHall().setCinema(cinema);
		Calendar c = Calendar.getInstance();
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 10);
		c.set(Calendar.SECOND, 0);
		int nowday = c.get(Calendar.DAY_OF_MONTH);
		if(day.equals("day1")){
			sch.setScheduleTime(c.getTime());
			slist1 = this.getCurrentSchedule(sch);
		}
		if(day.equals("day2")){
			c.set(Calendar.DATE,nowday+1);
			sch.setScheduleTime(c.getTime());
			slist1 = this.getCurrentSchedule(sch);
		}
		if(day.equals("day3")){
			c.set(Calendar.DATE,nowday+2);
			sch.setScheduleTime(c.getTime());
			slist1 = this.getCurrentSchedule(sch);
		}
		return slist1;
	}

	@Override
	public void updateSchedule(Schedule schedule) {
		dao.updateSchedule(schedule);		
	}
}
