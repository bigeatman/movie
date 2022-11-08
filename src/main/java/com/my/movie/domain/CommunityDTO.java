package com.my.movie.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CommunityDTO {
	private Connection conn;
	private ResultSet rs;
	
	//기본 생성자
	public CommunityDTO() {
		try {
			String dbURL = "jdbc:oracle:thin:@192.168.0.107:1521:xe";
			String dbId = "movie";
			String dbPw = "movie";
			Class.forName("org.oracle.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbId, dbPw);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//작성일자
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		//현재 게시글 내림차순 조회하여 가장 마지막글 번호 구하기
		String sql = "select communityNum from community order by communityNum desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1; // 첫번째 게시글인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	//글쓰기
	public int write(String communityTitle, String userId, String communityContent) {
		String sql = "insert into community values(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, communityTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, communityContent);
			pstmt.setInt(6, 1); // 글의 유효번호
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
}
















