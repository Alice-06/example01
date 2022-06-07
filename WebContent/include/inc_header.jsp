<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	
 	String menuGubun = request.getParameter("menuGubun");

 	if(menuGubun == null || menuGubun.trim().equals("")){
 		menuGubun = "dashBoard_index";
 	}
 	
 	String[] imsiArray = menuGubun.split("_");
 	String folderName = imsiArray[0];
 	String fileName = imsiArray[1];
 	String includePage = "../" + folderName + "/" + fileName + ".jsp";
%>