package com.bean;

import java.io.Serializable;
import java.sql.Date;

public class Film implements Serializable{
	@Override
	public String toString() {
		return "Film [filmId=" + filmId + ", filmName=" + filmName + ", totalTime=" + totalTime + ", filmSort="
				+ filmSort + ", releaseTime=" + releaseTime + ", director=" + director + ", scriptWriter="
				+ scriptWriter + ", actor=" + actor + ", country=" + country + ", filmCompany=" + filmCompany
				+ ", story=" + story + ", imgSrc=" + imgSrc + ", filmScore=" + filmScore + ", filmStorySort="
				+ filmStorySort + "]";
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String filmId;
	private String filmName;
	private String totalTime;
	private String filmSort;
	private Date releaseTime;
	private String director;
	private String scriptWriter;
	private String actor;
	private String country;
	private String filmCompany;
	private String story;
	private String imgSrc;
	private String filmScore;
	private FilmStorySort filmStorySort;
	public String getFilmId() {
		return filmId;
	}
	public void setFilmId(String filmId) {
		this.filmId = filmId;
	}
	public String getFilmName() {
		return filmName;
	}
	public void setFilmName(String filmName) {
		this.filmName = filmName;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	public String getFilmSort() {
		return filmSort;
	}
	public void setFilmSort(String filmSort) {
		this.filmSort = filmSort;
	}
	public Date getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getScriptWriter() {
		return scriptWriter;
	}
	public void setScriptWriter(String scriptWriter) {
		this.scriptWriter = scriptWriter;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getFilmCompany() {
		return filmCompany;
	}
	public void setFilmCompany(String filmCompany) {
		this.filmCompany = filmCompany;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public String getFilmScore() {
		return filmScore;
	}
	public void setFilmScore(String filmScore) {
		this.filmScore = filmScore;
	}
	public Film() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FilmStorySort getFilmStorySort() {
		return filmStorySort;
	}
	public void setFilmStorySort(FilmStorySort filmStorySort) {
		this.filmStorySort = filmStorySort;
	}
	public String getImgSrc() {
		return imgSrc;
	}
	public void setImgSrc(String imgSrc) {
		this.imgSrc = imgSrc;
	}
	
}
