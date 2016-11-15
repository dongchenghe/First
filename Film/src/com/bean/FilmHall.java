package com.bean;

import java.io.Serializable;

public class FilmHall implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String filmHallId;
	private String filmHallName;
	private Cinema cinema;
	public FilmHall() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getFilmHallId() {
		return filmHallId;
	}
	public void setFilmHallId(String filmHallId) {
		this.filmHallId = filmHallId;
	}
	public String getFilmHallName() {
		return filmHallName;
	}
	public void setFilmHallName(String filmHallName) {
		this.filmHallName = filmHallName;
	}
	public Cinema getCinema() {
		return cinema;
	}
	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}
}
