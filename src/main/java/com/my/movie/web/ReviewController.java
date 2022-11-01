package com.my.movie.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.dao.MovieDao;

@Controller
@RequestMapping("review")
public class ReviewController {

	@Autowired
	private MovieDao movieDao;

	@PostMapping
	public ModelAndView movieDetail(ModelAndView mv, @RequestParam(value = "movieNo") Integer movieNo) {
		mv.setViewName("review/review");
		System.out.println(movieNo);
		System.out.println(movieDao);
		System.out.println(movieDao.selectById(movieNo));
		return mv;
	}
}
