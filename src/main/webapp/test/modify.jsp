<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%> 

<script language = "javascript">  // 자바 스크립트 시작

function modifyCheck()
  {
   var form = document.modifyform;
   
   if( !form.user.value )
   {
    alert( "이름을 적어주세요" );
    form.user.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }  
 		form.submit();
  } 
</script>
<%
Class.forName("com.mysql.jdbc.Driver"); 
String url = "jdbc:mysql://localhost:3306/listdb"; 
String id = "root";
String pass = "1236";


String user = request.getParameter("user"); //write.jsp에서 name에 입력한 데이터값
String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값

int idx = Integer.parseInt(request.getParameter("idx"));

try {
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT user,title, memo FROM listdb02 WHERE NUM=" + idx;
	ResultSet rs = stmt.executeQuery(sql);

	
	if(rs.next()){
		
		user = rs.getString(1);
		title = rs.getString(2);
		memo = rs.getString(3);
	}
	
	rs.close();
	stmt.close();
	conn.close();

}catch(SQLException e) {
	out.println( e.toString() );
}
 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
<table>
<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../img/table_left.gif" width="5" height="30" /></td>
      <td>수정</td>
      <td width="5"><img src="../img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="user" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>

     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="수정" OnClick="javascript:modifyCheck();">
       <input type=button value="취소" OnClick="window.location='../list.jsp'">
      <td>&nbsp;</td>
     </tr>
     </form>
    </table>
   </td>
  </tr>
 </table>
</body> 
</html>

