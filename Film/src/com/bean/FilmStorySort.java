package com.bean;

import java.io.Serializable;

public class FilmStorySort implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sId;
	private String sorts;
	public FilmStorySort() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "FilmStorySort [sId=" + sId + ", sorts=" + sorts + "]";
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getSorts() {
		return sorts;
	}
	public void setSorts(String sorts) {
		this.sorts = sorts;
	}
}
