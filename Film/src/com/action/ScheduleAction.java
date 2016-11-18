package com.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bean.Cinema;
import com.bean.CurrentCinema;
import com.bean.Film;
import com.bean.FilmHall;
import com.bean.Schedule;
import com.opensymphony.xwork2.ActionContext;
import com.service.ICinemaService;
import com.service.IFilmService;
import com.service.IScheduleService;

public class ScheduleAction {
	private IScheduleService service;
	private String filmid;
	private ICinemaService service1;
	private IFilmService service2;
	public IScheduleService getService() {
		return service;
	}
	public void setService(IScheduleService service) {
		this.service = service;
	}
	public String schedule(){
		Map<String, Object> session= ActionContext.getContext().getSession(); 
		List<Cinema> listCinema=service1.getCinemasByFilm(filmid);
		Film f = new Film();
		f.setFilmId(filmid);
		Film film = service2.getFilm(f);
		List<CurrentCinema> listCurrentCinema1=new ArrayList<CurrentCinema>();
		List<CurrentCinema> listCurrentCinema2=new ArrayList<CurrentCinema>();
		List<CurrentCinema> listCurrentCinema3=new ArrayList<CurrentCinema>();
		for(Cinema cinema:listCinema){
			List<Schedule> list1 = service.getCurrentScheduleDay(cinema, filmid, "day1");
			List<Schedule> list2 = service.getCurrentScheduleDay(cinema, filmid, "day2");
			List<Schedule> list3 = service.getCurrentScheduleDay(cinema, filmid, "day3");
			if(list1.size()!=0){
				CurrentCinema cur = new CurrentCinema();
				cur.setCinema(cinema);
				cur.setSchedule(list1);
				listCurrentCinema1.add(cur);
			}
			if(list2.size()!=0){
				CurrentCinema cur = new CurrentCinema();
				cur.setCinema(cinema);
				cur.setSchedule(list2);
				listCurrentCinema2.add(cur);
			}
			if(list3.size()!=0){
				CurrentCinema cur = new CurrentCinema();
				cur.setCinema(cinema);
				cur.setSchedule(list3);
				listCurrentCinema3.add(cur);
			}
		}
		session.put("filmshow", film);
		session.put("filmSchedule1", listCurrentCinema1);
		session.put("filmSchedule2", listCurrentCinema2);
		session.put("filmSchedule3", listCurrentCinema3);
		return "success";
	}


	public String getFilmid() {
		return filmid;
	}


	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}


	public ICinemaService getService1() {
		return service1;
	}


	public void setService1(ICinemaService service1) {
		this.service1 = service1;
	}
	public static void main(String[] args) {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//c.set(c.YEAR, c.m, c.DATE);
		c.set(Calendar.HOUR, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		System.out.println(sim.format(c.getTime()));
		int nowday = c.get(Calendar.DAY_OF_MONTH);
		c.set(Calendar.DATE,nowday+1);
		System.out.println(sim.format(c.getTime()));
	}
	public IFilmService getService2() {
		return service2;
	}
	public void setService2(IFilmService service2) {
		this.service2 = service2;
	}
}
