package com.service;

import java.util.List;

import com.bean.Cinema;
import com.bean.Film;

public interface IitemService {
	
	List<Film> getFilmAll();
	List<Film> getFilmSoon();
	List<Cinema> getCinema();
	

}
