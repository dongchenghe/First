package com.dao;

import java.util.List;

import com.bean.Cinema;


public interface ICinemaDao {	
	List<Cinema> getCinemas(Cinema cinema);
	void updateCinema(Cinema cinema);
	void deleteCinema(Cinema cinema);
	void addCinema(Cinema cinema);
	
}
