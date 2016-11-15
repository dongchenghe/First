package com.service;

import java.util.List;

import com.bean.Film;
import com.dao.IFilmDao;

public class FilmService implements IFilmService{
	private IFilmDao dao;
	@Override
	public List<Film> getFilms(Film film) {
		// TODO Auto-generated method stub
		return dao.getFilms(film);
	}

	@Override
	public Film getFilm(Film film) {
		// TODO Auto-generated method stub
		return dao.getFilm(film);
	}

	@Override
	public void addFilm(Film film) {
		dao.addFilm(film);
		
	}

	@Override
	public void updateFilm(Film film) {
		dao.updateFilm(film);
		
	}

	@Override
	public void deleteFilm(Film film) {
		dao.deleteFilm(film);		
	}

	public IFilmDao getDao() {
		return dao;
	}
	public void setDao(IFilmDao dao) {
		this.dao = dao;
	}
	
}
