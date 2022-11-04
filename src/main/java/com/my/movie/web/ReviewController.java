package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.dao.GenreDao;
import com.my.movie.domain.ReviewDto;
import com.my.movie.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {

	@Autowired
	private ReviewService reivewService;

	@Autowired
	private GenreDao genreDao;

	@PostMapping
	public ModelAndView movieDetail(ModelAndView mv, @RequestParam(value = "movieNo") Integer movieNo) {

		ReviewDto dto = reivewService.getReviewDtoByMovieId(movieNo);

		if (dto.getMovie() == null) {
			mv.setViewName("../main");
		} else {
			mv.setViewName("review/review");
			mv.addObject("review", dto);
		}

		return mv;
	}
}