package com.bean;

import java.io.Serializable;

public class RealSeat implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public RealSeat() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String rlId;
	private String row;
	private String col;
	private FilmHall filmHall;
	public String getRlId() {
		return rlId;
	}
	public void setRlId(String rlId) {
		this.rlId = rlId;
	}
	public String getRow() {
		return row;
	}
	public void setRow(String row) {
		this.row = row;
	}
	public String getCol() {
		return col;
	}
	public void setCol(String col) {
		this.col = col;
	}
	public FilmHall getFilmHall() {
		return filmHall;
	}
	public void setFilmHall(FilmHall filmHall) {
		this.filmHall = filmHall;
	}
}
