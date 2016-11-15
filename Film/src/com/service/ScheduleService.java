package com.service;

import java.util.List;
import com.bean.FilmHall;
import com.dao.IFilmHallDao;


public class ScheduleService implements IFilmHallService{
	private IFilmHallDao dao;

	@Override
	public List<FilmHall> getFilmHalls(FilmHall filmHall) {
		
		return dao.getFilmHalls(filmHall);
	}

	@Override
	public void updateFilmHall(FilmHall filmHall) {
	dao.updateFilmHall(filmHall);
		
	}

	@Override
	public void deleteFilmHall(FilmHall filmHall) {
		dao.deleteFilmHall(filmHall);
		
	}

	@Override
	public void addFilmHall(FilmHall filmHall) {
		dao.addFilmHall(filmHall);
		
	}

	public IFilmHallDao getDao() {
		return dao;
	}

	public void setDao(IFilmHallDao dao) {
		this.dao = dao;
	}
	
	

}
