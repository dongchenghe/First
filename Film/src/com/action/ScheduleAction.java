package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.bean.Cinema;
import com.bean.CurrentCinema;
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
		System.out.println(listCinema);
		List<CurrentCinema> listCurrentCinema=new ArrayList<CurrentCinema>();
		for(Cinema cinema:listCinema){
			CurrentCinema cc=new CurrentCinema();
			cc.setCinema(cinema);
			Map<String,String> map = new HashMap<String, String>();
			map.put("cinema_id", cinema.getCinemaId());
			map.put("filmid", filmid);
			List<Schedule> list=service.getCurrentSchedule(map);
			cc.setSchedule(list);
			listCurrentCinema.add(cc);
		}
		/*for(CurrentCinema aaa:listCurrentCinema){
			for(Schedule sch:aaa.getSchedule()){
				System.out.println(sch);
			}
		}*/
		ActionContext.getContext().getSession().put("filmSchedule", listCurrentCinema);	
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
