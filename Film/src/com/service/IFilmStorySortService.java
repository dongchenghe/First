package com.service;

import java.util.List;

import com.bean.FilmStorySort;

public interface IFilmStorySortService {
	List<FilmStorySort> getFilmStorySorts(FilmStorySort filmStorySort);
	void deleteFilmStorySort(FilmStorySort filmStorySort);
	void addFilmStorySort(FilmStorySort filmStorySort);
	void updateFilmStorySort(FilmStorySort filmStorySort);
}
