package com.my.movie.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Community {
	private int communityNum;
	private String communityTitle;
	private String communityContent;
	private Date communityDate;
	private String communityImgFileName;
	private int communityUserNum;
	private String userId;
	private String getUserId;
}
