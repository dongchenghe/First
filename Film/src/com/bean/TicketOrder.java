package com.bean;

import java.io.Serializable;
import java.sql.Date;

public class TicketOrder implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ticketOrder;
	private Date orderDate;
	private String orderPwd;
	private String orderState;
	private Customer customer;
	public TicketOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTicketOrder() {
		return ticketOrder;
	}
	public void setTicketOrder(String ticketOrder) {
		this.ticketOrder = ticketOrder;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderPwd() {
		return orderPwd;
	}
	public void setOrderPwd(String orderPwd) {
		this.orderPwd = orderPwd;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
}
