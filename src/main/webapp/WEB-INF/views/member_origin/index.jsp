<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String context=request.getContextPath();
response.sendRedirect(context+"/member_origin/list.do");
%>
</body>
</html>