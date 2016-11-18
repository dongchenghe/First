package com.action;

import java.util.List;
import java.util.Map;

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
		Map<String,Object> sesstion = ActionContext.getContext().getSession();
		sesstion.put("listFilm", listFilm);
		sesstion.put("listSoon", listSoon);
		sesstion.put("listCinema", listCinema);
		for(Film f:listSoon){
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
