package com.dao;

import java.util.List;

import com.bean.FilmComment;

public interface IFilmCommentDao {
	List<FilmComment> getComments(FilmComment filmComment);
	FilmComment getComment(FilmComment filmComment);
	void updateFilmComment(FilmComment filmComment);
	void deleteFilmComment(FilmComment filmComment);
	void addFilmComment(FilmComment filmComment);
}

