package com.service;

import java.util.List;

import com.bean.Cinema;
import com.bean.Film;
import com.dao.IFilmDao;




public class ItemService implements IitemService {
	
	
	private IFilmDao dao;

	public IFilmDao getDao() {
		return dao;
	}

	public void setDao(IFilmDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Film> getFilmAll() {
		List<Film> listFilm=dao.getFilmAll();
		return listFilm;
	}

	@Override
	public List<Film> getFilmSoon() {
		List<Film> listFilmSoon=dao.getFilmSoon();
		return listFilmSoon;
	}

	@Override
	public List<Cinema> getCinema() {
		List<Cinema> listCinema=dao.getCinema();
		return listCinema;
	}

}
