package com.bean;

import java.io.Serializable;

public class FilmStorySort implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sid;
	private String sorts;
	public FilmStorySort() {
		super();
		// TODO Auto-generated constructor stub
	}
	


	@Override
	public String toString() {
		return "FilmStorySort [sid=" + sid + ", sorts=" + sorts + "]";
	}



	public String getSorts() {
		return sorts;
	}
	public void setSorts(String sorts) {
		this.sorts = sorts;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}
}
