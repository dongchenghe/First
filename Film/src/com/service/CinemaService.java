package com.service;

import java.util.List;

import com.bean.Cinema;

import com.dao.ICinemaDao;


public class CinemaService implements ICinemaService{
	private ICinemaDao dao;

	@Override
	public List<Cinema> getCinemas(Cinema cinema) {
		
		return dao.getCinemas(cinema);
	}


	@Override
	public void updateCinema(Cinema cinema) {
		dao.updateCinema(cinema);
		
	}

	@Override
	public void deleteCinema(Cinema cinema) {
		dao.deleteCinema(cinema);
		
	}

	@Override
	public void addCinema(Cinema cinema) {
		dao.addCinema(cinema);
	}

	public ICinemaDao getDao() {
		return dao;
	}

	public void setDao(ICinemaDao dao) {
		this.dao = dao;
	}

	
	

}
