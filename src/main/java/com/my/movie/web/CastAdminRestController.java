package com.my.movie.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.my.movie.domain.Cast;
import com.my.movie.domain.Director;
import com.my.movie.domain.request.GetCastRequest;
import com.my.movie.service.CastService;

@RestController
@RequestMapping("cst")
public class CastAdminRestController {

	@Autowired
	private CastService castService;

	@PostMapping("getdirector")
	public String getDirectors(GetCastRequest request) {
		List<Director> dirs = castService.selectAllDirector();
		
		try {
			return new ObjectMapper().writeValueAsString(dirs);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}
	
	@PostMapping("getactor")
	public String getActors(GetCastRequest request) {
		List<Cast> dirs = castService.selectAllCast();
		
		try {
			return new ObjectMapper().writeValueAsString(dirs);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "ERROR";
		}
	}
}
