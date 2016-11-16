package com.bean;

import java.util.List;

public class CurrentCinema {
	private Cinema cinema;
	private List<Schedule> schedule;
	public Cinema getCinema() {
		return cinema;
	}
	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}
	public List<Schedule> getSchedule() {
		return schedule;
	}
	public void setSchedule(List<Schedule> schedule) {
		this.schedule = schedule;
	}
	@Override
	public String toString() {
		return "CurrentCinema [cinema=" + cinema + ", schedule=" + schedule + "]";
	}
	

}
