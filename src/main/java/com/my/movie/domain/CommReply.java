package com.my.movie.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommReply {
	private String communityReplyContent;
	private LocalDate communityReplyDate;
	private String userId;
	private String nickname;
}
