package com.service;

import java.util.List;

import com.bean.Film;

public interface IFilmService {
	List<Film> getFilms(Film film);
	Film getFilm(Film film);
	void addFilm(Film film);
	void updateFilm(Film film);
	void deleteFilm(Film film);
}
