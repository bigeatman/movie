package com.my.movie.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Inspection {
	//신고목록페이지 변수선언
	private Integer inspectionNum;
	private Integer inspectionContentNum;
	private String inspectionContentName;
	private String inspectionStatus;
	private String inspectionStatusName;
	private LocalDate resultDate;
	
	//union 변수선언
	private String userId;
	private String userName;
	private String nickname;
	private String anyContent;
	private Integer inspectionDetailsCount;
	
	//신고상세페이지 변수선언
	private Integer inspectionDetailNum;
	private String anyInspectionContent;
}
