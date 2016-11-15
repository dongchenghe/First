package com.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.bean.FilmStorySort;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IFilmStorySortService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class FilmStorySortManagerAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IFilmStorySortService service;
	private int page;
	private int rows;
	private FilmStorySort filmStorySort;
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
	public String getFilmStorySorts() throws IOException{
		List<FilmStorySort> lists=service.getFilmStorySorts(filmStorySort);
		List<FilmStorySort> list=new ArrayList<FilmStorySort>();
		Map<String, Object> map=new HashMap<>();
		int start=(page-1)*rows;
		FilmStorySort filmStorySort=null;
		int count=((lists.size()-start)<rows)?(lists.size()-start):rows;
	
		for(int i=0;i<count;i++){
			filmStorySort=lists.get(i+start);
			list.add(filmStorySort);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer=ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		JSONObject object=JSONObject.fromObject(map);
		writer.println(object);
		writer.flush();
		writer.close();
		return null;
	}
	public String getAllFilmStorySorts() throws IOException {
		List<FilmStorySort> lists=service.getFilmStorySorts(null);
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer=ServletActionContext.getResponse().getWriter();
		JSONArray jsonArray=JSONArray.fromObject(lists);
		writer.println(jsonArray);
		writer.flush();
		writer.close();
		return null;
		
	}
	public String deleteFilmStorySort() {
		service.deleteFilmStorySort(filmStorySort);
		return null;	
	}
	public String addFilmStorySort() {
		service.addFilmStorySort(filmStorySort);
		return null;
		
	}
	public String updateFilmStorySort() {
		service.updateFilmStorySort(filmStorySort);
		return null;
		
	}
	public IFilmStorySortService getService() {
		return service;
	}
	public void setService(IFilmStorySortService service) {
		this.service = service;
	}
	public FilmStorySort getFilmStorySort() {
		return filmStorySort;
	}
	public void setFilmStorySort(FilmStorySort filmStorySort) {
		this.filmStorySort = filmStorySort;
	}

}
