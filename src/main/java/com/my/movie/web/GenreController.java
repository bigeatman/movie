package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.movie.service.GenreService;

@RestController
@RequestMapping("admin/genre")
public class GenreController {
	@Autowired private GenreService genreService;
	
	@GetMapping("addGenre")
	public ModelAndView addGenre(ModelAndView mv) {
		mv.setViewName("admin/genre/addGenre");
		return mv;
	}
	
	@PostMapping("addGenre")
	public void addGenre(@RequestBody List<String> genreName) {
		System.out.println(genreName);
		for(String genre: genreName) {
			System.out.println("장르: " + genre);
		}
	}
}