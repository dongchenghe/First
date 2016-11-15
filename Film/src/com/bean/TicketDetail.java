package com.bean;

import java.io.Serializable;

public class TicketDetail implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ticketId;
	private String ticketOrderId;
	private Seat_State seatState;
	public TicketDetail() {
		super();
	}
	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	public String getTicketOrderId() {
		return ticketOrderId;
	}
	public void setTicketOrderId(String ticketOrderId) {
		this.ticketOrderId = ticketOrderId;
	}

	public double getTicketPrice() {
		return ticketPrice;
	}
	public void setTicketPrice(double ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public Seat_State getSeatState() {
		return seatState;
	}
	public void setSeatState(Seat_State seatState) {
		this.seatState = seatState;
	}

	private double ticketPrice;
}
