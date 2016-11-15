package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.bean.Cinema;
import com.bean.FilmHall;
import com.service.ICinemaService;
import com.service.IFilmHallService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class FilmHallAction {
	private IFilmHallService service;
	private ICinemaService cinemaService;
	//用来接受easyui datagrid分页传过来的参数
	private int page;
	private int rows;
	//用来获取ajax传过来的参数
	
	private FilmHall filmHall;
	/**
	 * 查询影厅信息
	 * @return null
	 * @throws IOException
	 */
	public String getFilmHalls() throws IOException{System.out.println(filmHall);
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		List<FilmHall> filmHalls=service.getFilmHalls(filmHall);
		List<FilmHall> list=new ArrayList<>();
		Map<String,Object> map=new HashMap<>();
		int start=(page-1)*rows;
		FilmHall filmHall=null;
		int count=0;
		if((filmHalls.size()-start)<rows){
			count =filmHalls.size()-start;
		}else{
			count =rows;
		}
		for(int i=0;i<count;i++){
			filmHall=filmHalls.get(start+i);
			list.add(filmHall);		
		}   
		PrintWriter out =ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", filmHalls.size());
		JSONObject jsonObject =JSONObject.fromObject(map);
		out.println(jsonObject);
		out.flush();
		
		return null;
	};
	
	/**
	 * 删除影厅信息
	 * @return null
	 */
	public String deleteFilmHall(){
		if("".equals(filmHall.getFilmHallId())){
			return null;
		}
		service.deleteFilmHall(filmHall);
		return null;
	}
	
	
	
	/**
	 * 修改影厅信息
	 * @return	null
	 */
	public String updateFilmHall(){
		if("".equals(filmHall.getFilmHallId())){
			return null;
		}
		service.updateFilmHall(filmHall);
		return null;
	}
	/**
	 * 增加一个影厅信息
	 * @return null
	 */
	public String addFilmHall(){
		service.addFilmHall(filmHall);	
		return null;
	}
	/**
	 * 获取全部的cinema信息
	 * @return null
	 * @throws IOException
	 */
	public String getCinemas() throws IOException {
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		List<Cinema> cinemas=cinemaService.getCinemas(null);
		PrintWriter out =ServletActionContext.getResponse().getWriter();
		JSONArray jsonArray =JSONArray.fromObject(cinemas);
		out.println(jsonArray);
		out.flush();
		return null;
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

	public IFilmHallService getService() {
		return service;
	}

	public void setService(IFilmHallService service) {
		this.service = service;
	}

	public ICinemaService getCinemaService() {
		return cinemaService;
	}

	public void setCinemaService(ICinemaService cinemaService) {
		this.cinemaService = cinemaService;
	}

	public FilmHall getFilmHall() {
		return filmHall;
	}

	public void setFilmHall(FilmHall filmHall) {
		this.filmHall = filmHall;
	}





	


	
	

	
	
}
