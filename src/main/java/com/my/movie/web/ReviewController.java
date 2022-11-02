package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.dao.MovieDao;
import com.my.movie.domain.Movie;

@Controller
@RequestMapping("review")
public class ReviewController {

	@Autowired
	private MovieDao movieDao;

	@PostMapping
	public ModelAndView movieDetail(ModelAndView mv, @RequestParam(value = "movieNo") Integer movieNo) {
		Movie targetMovie = movieDao.selectById(movieNo);
		System.out.println(targetMovie);

		if (targetMovie == null) {
			mv.setViewName("../main");
		} else {
			mv.setViewName("review/review");
		}

		mv.addObject("movie", targetMovie);

		return mv;
	}
}
