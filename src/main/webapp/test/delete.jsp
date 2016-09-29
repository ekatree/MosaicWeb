<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
			
<%
	request.setCharacterEncoding("euc-kr");
	String url = "jdbc:mysql://localhost:3306/listdb";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
	String id = "root";         // SQL 사용자 이름
	String pw = "1236";     // SQL 사용자 패스워드
	Class.forName("com.mysql.jdbc.Driver");   
	int idx = Integer.parseInt(request.getParameter("idx"));
/* 	String passw = request.getParameter("password"); */
	
	try{
				
		Connection conn = DriverManager.getConnection(url,id,pw);
		Statement stmt = conn.createStatement();
		   			
			String sql = "DELETE FROM listdb02 WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("delete ok");
   				location.href="http://localhost:8082/TEST/list.jsp";
  			</script>

<%
	
		stmt.close();
		conn.close();
		
		 
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>