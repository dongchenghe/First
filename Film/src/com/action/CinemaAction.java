package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.bean.Cinema;
import com.bean.Job;
import com.bean.Staff;
import com.service.ICinemaService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CinemaAction {
	private ICinemaService service;
	//用来接受easyui datagrid分页传过来的参数
	private int page;
	private int rows;
	//用来获取ajax传过来的参数	
	private Cinema cinema;
	/**
	 * 查询影城信息
	 * @return null
	 * @throws IOException
	 */
	public String getCinemas() throws IOException{
		System.out.println(cinema);
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		List<Cinema> cinemas=service.getCinemas(cinema);
		List<Cinema> list=new ArrayList<>();
		Map<String,Object> map=new HashMap<>();
		int start=(page-1)*rows;
		Cinema cinema=null;
		int count=0;
		if((cinemas.size()-start)<rows){
			count =cinemas.size()-start;
		}else{
			count =rows;
		}
		for(int i=0;i<count;i++){
			cinema=cinemas.get(start+i);
			list.add(cinema);		
		}   
		PrintWriter out =ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", cinemas.size());
		JSONObject jsonObject =JSONObject.fromObject(map);
		out.println(jsonObject);
		out.flush();
		
		return null;
	};
	
	/**
	 * 删除影城信息
	 * @return null
	 */
	public String deleteCinema(){System.out.println(cinema);
		if("".equals(cinema.getCinemaId())){
			return null;
		}
		service.deleteCinema(cinema);;
		return null;
	}
	
	
	
	/**
	 * 修改影城信息
	 * @return	null
	 */
	public String updateCinema(){
		if("".equals(cinema.getCinemaId())){
			return null;
		}
		service.updateCinema(cinema);;
		return null;
	}
	/**
	 * 增加一个影城信息
	 * @return null
	 */
	public String addCinema(){
		service.addCinema(cinema);;	
		return null;
	}
	
	public ICinemaService getService() {
		return service;
	}

	public void setService(ICinemaService service) {
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

	public Cinema getCinema() {
		return cinema;
	}

	public void setCinema(Cinema cinema) {
		this.cinema = cinema;
	}



	


	
	

	
	
}
