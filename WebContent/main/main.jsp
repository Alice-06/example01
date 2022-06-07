<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<table border="0" width="90%" align="center">
	<tr>
		<td height="100">
			<jsp:include page = "../include/inc_menu_top.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td style="padding: 50px 0px;">
				<jsp:include page="<%=includePage %>"></jsp:include>
		</td> 
	</tr>
</table>
</body>
</html>
