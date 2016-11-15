package com.service;

import java.util.List;

import com.bean.FilmHall;


public interface IFilmHallService {
	List<FilmHall> getFilmHalls(FilmHall filmHall);
	void updateFilmHall(FilmHall filmHall);
	void deleteFilmHall(FilmHall filmHall);
	void addFilmHall(FilmHall filmHall);
}
