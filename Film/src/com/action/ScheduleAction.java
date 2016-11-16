package com.action;

import java.util.Iterator;
import java.util.List;

import com.bean.Schedule;
import com.service.IScheduleService;

public class ScheduleAction {
	private IScheduleService service;
	
	
	public IScheduleService getService() {
		return service;
	}


	public void setService(IScheduleService service) {
		this.service = service;
	}


	public String schedule(){
		List<Schedule> list=service.getCurrentSchedule("1");
			Iterator<Schedule > it=list.iterator();
			while(it.hasNext()){
				System.out.println(it.next());
			}
		
		return "schedule";
		
	}

}
