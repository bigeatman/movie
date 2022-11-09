package com.my.movie.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminUser {
	private int adminNum;
	private String adminId;
	private String pw;
	private String nickname;
	private String phoneNum;
	private String email;
}