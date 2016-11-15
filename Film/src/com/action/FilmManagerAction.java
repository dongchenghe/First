package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.bean.Film;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IFilmService;
import net.sf.json.JSONObject;
public class FilmManagerAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IFilmService service;
	private int page;
	private int rows;
	private Film film;
	public void setService(IFilmService service) {
		this.service = service;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}



	public String getFilms() throws IOException{
		System.out.println(film);
		List<Film> lists=service.getFilms(film);
		List<Film> list=new ArrayList<Film>();
		Map<String, Object> map=new HashMap<>();
		int start=(page-1)*rows;
		Film film=null;
		int count=((lists.size()-start)<rows)?(lists.size()-start):rows;
	
		for(int i=0;i<count;i++){
			film=lists.get(i+start);
			list.add(film);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer=ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		JSONObject object=JSONObject.fromObject(map);
		writer.println(object);
		return null;
	}
	public String updateFilm() {
		service.updateFilm(film);
		return null;
		
	}
	public String deleteFilm(){
		service.deleteFilm(film);
		return null;
		
	}
	public String addFilm(){
		service.addFilm(film);
		return null;		
	}
	public IFilmService getService() {
		return service;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
}
