<%@page import="config.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file = "_inc_top.jsp" %>
<%
	String name =  request.getParameter("name");
	String memo = request.getParameter("memo");
	
	MemoDTO imsiDto = new MemoDTO();
	imsiDto.setName(name);
	imsiDto.setMemo(memo);	
	
 	MemoDAO dao = new MemoDAO();
	int result = dao.setInsert(imsiDto);
	 
	if(result > 0){
		out.println("<script>");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	} 

%>