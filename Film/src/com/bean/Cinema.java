package com.bean;

import java.io.Serializable;

public class Cinema implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cinemaId;
	private String cinemaName;
	private String cinemaLocation;
	private String cinemaTel;
	private String imgSrc;

	public String getCinemaId() {
		return cinemaId;
	}
	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}
	public String getCinemaName() {
		return cinemaName;
	}
	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}
	public String getCinemaLocation() {
		return cinemaLocation;
	}
	public void setCinemaLocation(String cinemaLocation) {
		this.cinemaLocation = cinemaLocation;
	}
	public String getCinemaTel() {
		return cinemaTel;
	}
	public void setCinemaTel(String cinemaTel) {
		this.cinemaTel = cinemaTel;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	public Cinema() {
		super();		
	}	
}
