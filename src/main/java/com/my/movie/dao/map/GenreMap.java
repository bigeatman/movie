package com.my.movie.dao.map;

import java.util.List;

import com.my.movie.domain.Genre;
import com.my.movie.domain.Movie;

public interface GenreMap {

	/** 영화id 입력, 영화 장르 출력 */
	List<String> getMovieGenre(int movieNum);

	/** 장르명 입력, 해당 장르 id 출력 */
	Integer getGenreId(String genreName);
	
	/** 장르명 입력, 장르에 해당하는 영화 목록 출력 */
	List<Movie> searchMovieByGenre(String genreName);

	/** 전체 장르 출력 */
	List<Genre> selectAll();

	/** 유저 선호 장르 입력 */
	void insertUserGenre(int userId, int genre);

	/** 영화 장르 입력 */
	void insertMovieGenre(int movieId, int genre);
}
