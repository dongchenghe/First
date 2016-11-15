package com.service;
import java.util.List;
import com.bean.FilmStorySort;
import com.dao.IFilmStorySortDao;
public class FilmStorySortService implements IFilmStorySortService{
	private IFilmStorySortDao dao;
	@Override
	public List<FilmStorySort> getFilmStorySorts(FilmStorySort filmStorySort) {
		return dao.getFilmStorySorts(filmStorySort);
	}

	@Override
	public void deleteFilmStorySort(FilmStorySort filmStorySort) {
		dao.deleteFilmStorySort(filmStorySort);
		
	}

	@Override
	public void addFilmStorySort(FilmStorySort filmStorySort) {
		dao.addFilmStorySort(filmStorySort);
		
	}

	@Override
	public void updateFilmStorySort(FilmStorySort filmStorySort) {
		dao.updateFilmStorySort(filmStorySort);
		
	}

	public IFilmStorySortDao getDao() {
		return dao;
	}

	public void setDao(IFilmStorySortDao dao) {
		this.dao = dao;
	}
}
