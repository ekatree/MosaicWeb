<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello.jsp</title>
</head>
<body>
<% for (int i=0; i<10; i++)  {%>
<h1>Hello.jsp 실행 확인 됨 ....i=<%= i %></h1>
<%} %>
</body>
</html>