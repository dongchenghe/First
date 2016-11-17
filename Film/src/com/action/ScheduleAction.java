package com.action;

import java.util.ArrayList;
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
import com.service.IScheduleService;

public class ScheduleAction {
	private IScheduleService service;
	private String filmid;
	private ICinemaService service1;
	public IScheduleService getService() {
		return service;
	}
	public void setService(IScheduleService service) {
		this.service = service;
	}
	public String schedule(){
		List<Cinema> listCinema=service1.getCinemasByFilm(filmid);
		List<CurrentCinema> listCurrentCinema1=new ArrayList<CurrentCinema>();
		List<CurrentCinema> listCurrentCinema2=new ArrayList<CurrentCinema>();
		List<CurrentCinema> listCurrentCinema3=new ArrayList<CurrentCinema>();
		for(Cinema cinema:listCinema){
			Schedule sch = new Schedule();
			sch.setFilm(new Film());
			sch.getFilm().setFilmId(filmid);
			sch.setFilmHall(new FilmHall());
			sch.getFilmHall().setCinema(cinema);
			Date date = new Date();
			sch.setScheduleTime(date);
			if(service.getCurrentSchedule(sch).size()!=0){
				CurrentCinema cc=new CurrentCinema();
				cc.setCinema(cinema);
				listCurrentCinema1.add(cc);	
			}
		}
		for(CurrentCinema aaa:listCurrentCinema1){
			for(Schedule sch:aaa.getSchedule()){
				System.out.println(sch);
			}
		}
		ActionContext.getContext().getSession().put("filmSchedule", listCurrentCinema1);	
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


	
	
}
