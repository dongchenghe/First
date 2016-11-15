package com.bean;

import java.io.Serializable;
import java.sql.Date;

public class Schedule implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Schedule() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String scheduleId;
	private Date scheduleTime;
	private double ticketPrice;
	private Film film;
	private FilmHall filmHall;
	public String getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Date getScheduleTime() {
		return scheduleTime;
	}
	public void setScheduleTime(Date scheduleTime) {
		this.scheduleTime = scheduleTime;
	}
	
	public double getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	public FilmHall getFilmHall() {
		return filmHall;
	}
	public void setFilmHall(FilmHall filmHall) {
		this.filmHall = filmHall;
	}
	

}
