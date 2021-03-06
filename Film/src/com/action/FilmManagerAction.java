package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import com.bean.Film;
import com.bean.FilmStorySort;
import com.opensymphony.xwork2.ActionSupport;
import com.service.IFilmService;
import com.util.JsonDateValueProcessor;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class FilmManagerAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IFilmService service;
	private int page;
	private int rows;
	private Film film;
	private File picture;
	private String pictureContentType;
	private String pictureFileName;
	private String sid;
	public File getPicture() {
		return picture;
	}

	public void setPicture(File picture) {
		this.picture = picture;
	}

	public String getPictureContentType() {
		return pictureContentType;
	}

	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}

	public String getPictureFileName() {
		return pictureFileName;
	}

	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}

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

	public String getFilms() throws IOException {
		if(sid!=null&&sid.length()!=0){
			System.out.println("YY");
			System.out.println(sid);
			film.setFilmStorySort(new FilmStorySort());
			film.getFilmStorySort().setSid(sid);
		}else {
			System.out.println("hehe");
		}
		System.out.println(film);
		List<Film> lists = service.getFilms(film);
		List<Film> list = new ArrayList<Film>();
		Map<String, Object> map = new HashMap<>();
		int start = (page - 1) * rows;
		Film film = null;
		int count = ((lists.size() - start) < rows) ? (lists.size() - start) : rows;
		JsonConfig config = new JsonConfig();
		config.setIgnoreDefaultExcludes(false);
		config.registerJsonValueProcessor(java.util.Date.class, new JsonDateValueProcessor("yyyy-MM-dd "));
		for (int i = 0; i < count; i++) {
			film = lists.get(i + start);
			list.add(film);
		}
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
		map.put("rows", list);
		map.put("total", lists.size());
		JSONObject object = JSONObject.fromObject(map, config);
		writer.println(object);
		writer.flush();
		return null;
	}
	public String getcombobox() throws IOException{
		ServletActionContext.getResponse().setContentType("text/javascript;charset=utf-8");
		PrintWriter writer = ServletActionContext.getResponse().getWriter();
	
		List<Film> lists = service.getFilms(null);
		System.out.println(lists.size());
		JSONArray jsonArray=JSONArray.fromObject(lists);
		writer.print(jsonArray);
		System.out.println(jsonArray);
		return null;		
	}
	public String updateFilm() {
		System.out.println(film);
		if (picture != null) {
			File saved = new File(ServletActionContext.getServletContext().getRealPath("images/film"), pictureFileName);
			InputStream ins = null;
			OutputStream ous = null;
			try {
				saved.getParentFile().mkdirs();

				ins = new FileInputStream(picture);
				ous = new FileOutputStream(saved);

				byte[] b = new byte[1024];
				int len = 0;
				while ((len = ins.read(b)) != -1) {
					ous.write(b, 0, len);
				}
				film.setImgSrc("film/" + pictureFileName);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (ous != null) {
					try {
						ous.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();	
					}
				}
				if (ins != null) {
					try {
						ins.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		// System.out.println("film/"+pictureFileName);
		service.updateFilm(film);
		return null;
	}

	public String deleteFilm() {
		System.out.println(film);
		service.deleteFilm(film);
		return null;

	}

	public String addFilm() throws IOException {
		System.out.println(film);
		if(film!=null){
			File saved = new File(ServletActionContext.getServletContext().getRealPath("images/film"), pictureFileName);
			InputStream ins = null;
			OutputStream ous = null;
			try {
				saved.getParentFile().mkdirs();
	
				ins = new FileInputStream(picture);
				ous = new FileOutputStream(saved);
	
				byte[] b = new byte[1024];
				int len = 0;
				while ((len = ins.read(b)) != -1) {
					ous.write(b, 0, len);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (ous != null) {
					ous.close();
				}
				if (ins != null) {
					ins.close();
				}
			}
			// System.out.println("film/"+pictureFileName);
			film.setImgSrc("film/" + pictureFileName);
		}
		System.out.println(film);
		service.addFilm(film);
		System.out.println("OK");
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

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}
}
