package com.bean;

import java.io.Serializable;

public class Seat_State implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String seatId;
	private String seatState;
	private RealSeat realSeat;
	private Schedule schedule;
	public Seat_State() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSeatId() {
		return seatId;
	}
	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}
	public String getSeatState() {
		return seatState;
	}
	public void setSeatState(String seatState) {
		this.seatState = seatState;
	}
	public RealSeat getRealSeat() {
		return realSeat;
	}
	public void setRealSeat(RealSeat realSeat) {
		this.realSeat = realSeat;
	}
	public Schedule getSchedule() {
		return schedule;
	}
	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}
}
