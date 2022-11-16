package com.my.movie.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Community {
	private int communityNum;
	private String communityTitle;
	private String communityContent;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date communityDate;
	private String communityImgFileName;
	private int communityUserNum;
	private String userId;
	private String getUserId;
	private int userNum;
	private String nickname;
}
