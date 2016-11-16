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
import com.util.JsonDateValueProcessor;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
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
		List<Film> lists=service.getFilms(film);
		List<Film> list=new ArrayList<Film>();
		Map<String, Object> map=new HashMap<>();
		int start=(page-1)*rows;
		Film film=null;
		int count=((lists.size()-start)<rows)?(lists.size()-start):rows;
		JsonConfig config = new JsonConfig();  
		 config.setIgnoreDefaultExcludes(false);          
		 config.registerJsonValueProcessor(java.util.Date.class, new JsonDateValueProcessor("yyyy-MM-dd "));         
		for(int i=0;i<count;i++){
			film=lists.get(i+start);
			list.add(film);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer=ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		System.out.println(map);
		JSONObject object= JSONObject.fromObject(map,config);
		writer.println(object);
		writer.flush();
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
