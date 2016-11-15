package com.bean;

import java.io.Serializable;
import java.sql.Date;

public class FilmComment implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cId;
	private double customerScore;
	private String cDetails;
	private Date cDate;
	private Film film;
	private Customer customer;
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public double getCustomerScore() {
		return customerScore;
	}
	public void setCustomerScore(double customerScore) {
		this.customerScore = customerScore;
	}
	public String getcDetails() {
		return cDetails;
	}
	public void setcDetails(String cDetails) {
		this.cDetails = cDetails;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}
