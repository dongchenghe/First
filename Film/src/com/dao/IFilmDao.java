package com.dao;

import java.util.List;

import com.bean.Cinema;
import com.bean.Film;

public interface IFilmDao {
	List<Film> getFilms(Film film);
	Film getFilm(Film film);
	void addFilm(Film film);
	void updateFilm(Film film);
	void deleteFilm(Film film);
	List<Film> getFilmAll();
	List<Film> getFilmSoon();
	List<Cinema> getCinema();
	Film detailsFilm(String filmId);
}
