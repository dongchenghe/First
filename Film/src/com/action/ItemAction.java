package com.action;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bean.Cinema;
import com.bean.Film;
import com.opensymphony.xwork2.ActionContext;
import com.service.IitemService;

public class ItemAction {
	IitemService service;
	public String index(){
		List<Film>	listFilm=service.getFilmAll();
		List<Film> listSoon=service.getFilmSoon();
		List<Cinema> listCinema=service.getCinema();
		ActionContext.getContext().getSession().put("listFilm", listFilm);
		ActionContext.getContext().getSession().put("listSoon", listSoon);
		ActionContext.getContext().getSession().put("listCinema", listCinema);
		for(Film f:listFilm){
			System.out.println(f);
		}
		return "success";
	}
	public IitemService getService() {
		return service;
	}
	public void setService(IitemService service) {
		this.service = service;
	}
}
