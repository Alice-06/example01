<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	request.setCharacterEncoding("UTF-8");
	String menuGubun = request.getParameter("menuGubun");

 	String[] imsiArray = menuGubun.split("_");
 	String folderName = imsiArray[0];
 	String fileName = imsiArray[1];
 	String includePage = "../" + folderName + "/" + fileName + ".jsp";
	
%>

<jsp:include page="<%=includePage%>"></jsp:include>