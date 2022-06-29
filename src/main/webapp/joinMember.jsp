<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 변수 선언 -->
<%!
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	String driverName="com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/odbo";
	String username = "root";
	String password = "12345";	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		Class.forName(driverName);
		conn = DriverManager.getConnection(url, username, password);
		String sql = "INSERT INTO testmember(id, pw, name, email, phone, gender) VALUES(?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);	//sql 인수 삽입 주의
		
		pstmt.setString(1, "KIM");	//value의 첫번째 값
		pstmt.setString(2, "12345");
		pstmt.setString(3, "김길동");
		pstmt.setString(4, "kim@abc.com");
		pstmt.setString(5, "010-4446-8887");
		pstmt.setString(6, "man");
		
		//성공시 1 반환
		int flag = pstmt.executeUpdate();
		System.out.print(flag);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>