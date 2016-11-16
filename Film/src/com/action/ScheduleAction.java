package com.action;

import java.util.Iterator;
import java.util.List;

import com.bean.Schedule;
import com.opensymphony.xwork2.ActionContext;
import com.service.IScheduleService;

public class ScheduleAction {
	private IScheduleService service;
	private String filmid;
	
	public IScheduleService getService() {
		return service;
	}


	public void setService(IScheduleService service) {
		this.service = service;
	}


	public String schedule(){
		List<Schedule> list=service.getCurrentSchedule(filmid);
/*		for(Schedule s:list){
			System.out.println(s);
		}*/
		ActionContext.getContext().getSession().put("filmSchedule", list);	
		return "success";
	}


	public String getFilmid() {
		return filmid;
	}


	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}

}
