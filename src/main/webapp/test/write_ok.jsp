<%@ page import="java.sql.*"%> 
<%
	request.setCharacterEncoding("euc-kr"); //받아오는 값들을 한글로 인코딩합니다.


	Class.forName("com.mysql.jdbc.Driver"); 
	String url = "jdbc:mysql://localhost:3306/listdb"; 
	String id = "zerock";
	String pass = "kms0685!";


	String user = request.getParameter("user"); //write.jsp에서 name에 입력한 데이터값
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
	String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
	
	int max = 0;
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(NUM) FROM listdb02";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			max=rs.getInt(1);
		}
		
		sql = "INSERT INTO listdb02(user,title,memo,date,ref) VALUES(?,?,?,now(),?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, user);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setInt(4, max+1);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	} 

%>
 <script language=javascript>
   self.window.alert("Complete");
   location.href="/test/list.jsp"; 
   </script>