<%@page import="java.util.ArrayList"%>
<%@page import="com.haeun.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.haeun.dao.*" %>
<%@ page import="com.haeun.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao dao = new MemberDao();
	ArrayList<MemberDto> dtos = dao.memberList();
	
	for(int i=0; i<dtos.size(); i++) {
		MemberDto dto = dtos.get(i);	//첫번째 dto 가져오기
		String mid = dto.getId();
		String mpw = dto.getPw();
		String mname = dto.getName();
		String memail = dto.getEmail();
		String mphone = dto.getPhone();
		String mgender = dto.getGender();
		
		out.println("아이디 : "+ mid + "<br>");
		out.println("비밀번호 : "+ mpw + "<br>");
		out.println("이름 : "+ mname + "<br>");
		out.println("이메일 : "+ memail + "<br>");
		out.println("전화번호 : "+ mphone + "<br>");
		out.println("성별 : "+ mgender + "<br>");
		out.println("<br>");
		out.println("================");
		out.println("<br>");
	}
%>
</body>
</html>