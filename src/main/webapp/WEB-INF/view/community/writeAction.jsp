<%-- <%@page import="java.io.PrintWriter"%>
<%@page import="com.my.movie.domain.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<jsp:setProperty name="community" property="communityTitle" />
<jsp:setProperty name="community" property="communityContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글 추가</title>
</head>
<body>
<%
	//현재 세션 상태를 체크
	String userId = null;
	if(session.getAttribute("userID") != null){
		userId = (String)session.getAttribute("userID");
	}
	
	// 로그인을 한 사람만 글을 쓸 수 있도록
	if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
	}else{
			if(community.getCommunityTitle() == null || community.getCommunityContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
	}else{
		CommunityDTO communityDTO = new CommunityDTO();
		int result = communityDTO.write(community.getCommunityTitle(), userId, community.getCommunityContent());
		
		if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
		}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("('글쓰기 성공')");
				script.println("location.href='list.jsp'");
				script.println("</script>");
		}
	}	
}			
%>		
</body>
</html> --%>